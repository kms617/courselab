require 'rails_helper'

RSpec.describe Course, model: true do

  long_entry = "a" * 200
  fake_entry = "a" * 300

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:source) }

  it { should have_valid(:title).when('MATLab Made Easy', 'Advanced MATLab') }
  it { should_not have_valid(:title).when(nil, '', long_entry) }

  it { should have_valid(:url).when('http://www.mathworks.com', 'http://www.edx.edu') }
  it { should_not have_valid(:url).when(nil, '', 'some random text', 'word') }

  it { should have_valid(:source).when('Codey', 'MIT') }
  it { should_not have_valid(:source).when(nil, '', long_entry) }

  it { should have_valid(:description).when('Fundamentals of MATLab', 'Advanced something something') }
  it { should_not have_valid(:description).when(nil, '',fake_entry) }

end

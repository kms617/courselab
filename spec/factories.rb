FactoryGirl.define do

  factory :course do
    sequence(:title) { |n| "MATLab Course #{n}" }
    sequence(:url) { |n| "http://www.fakecourse#{n}.edu"}
    sequence(:source) { |n| "Fake MOOC #{n}"}
    description "Great course for learning MATLab"
  end

end

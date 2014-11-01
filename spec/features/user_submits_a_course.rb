require 'rails_helper'

feature 'user submits a course' do
  let(:sample_photo) do
    Rails.root.join("spec/data/matlab.jpg")
  end

  scenario 'user submits a complete form' do
    # User Story: I can submit a new course, which must contain:
    # -course title
    # -an image (or a default image)
    # -course url
    # -course source
    # After I submit a complete form, I am notified that my submission
    # was successful and I am redirected to the index

    course = FactoryGirl.build(:course)

    visit new_course_path

    fill_in "Title", with: course.title
    attach_file "course_image", sample_photo
    fill_in "Url", with: course.url
    fill_in "Source", with: course.source
    fill_in "Description", with: course.description
    click_button "Create Course"

    expect(page).to have_content("Course successfully submitted.")
    expect(page).to have_content(course.title)
    expect(page).to have_css("img[alt=\"matlab\"]")
    expect(page).to have_content(course.url)
    expect(page).to have_content(course.source)
    expect(page).to have_content(course.description)
  end

  scenario 'user submits an incomplete form' do
    # User Story: 1a. If I fail to submit a complete form
    # I want to receive an error message prompting me
    # to provide the correct information and alerting me to my errors.

    visit new_course_path

    click_button "Create Course"

    expect(page).to have_content("There was a problem, please try again.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Url can't be blank")
    expect(page).to have_content("Source can't be blank")
  end

  scenario 'user submits a form with errors' do
    # User Story: 1b. If there are errors in my form,
    # I want to receive an error message detailing my
    # mistakes so that I can correct them.

    fake_entry = "a" * 300

    visit new_course_path

    fill_in "Title", with: fake_entry
    fill_in "Url", with: "abc"
    fill_in "Source", with: fake_entry
    click_button "Create Course"

    expect(page).to have_content("There was a problem, please try again.")
    expect(page).to have_content("Title is too long")
    expect(page).to have_content("Url is not a valid url")
    expect(page).to have_content("Source is too long")
  end
end

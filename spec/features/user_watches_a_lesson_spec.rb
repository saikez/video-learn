require 'rails_helper'

RSpec.feature "User watches a lesson", type: :feature do
  let(:user) {create(:user)}
  let(:course) {create(:course)}
  let!(:lesson){create(:lesson, course: course)}
  let!(:comment){create(:comment, lesson: lesson, user: user)}

  it 'allows the user to watch a lesson' do
    sign_in user
    visit root_path
    click_link course.title

    expect(page).to have_content(course.description)
    click_link lesson.title
    expect(find('iframe')[:src]).to eq(lesson.video_link)
  end

  it 'allows the user to comment on a lesson' do
    sign_in user
    visit root_path
    click_link course.title
    click_link lesson.title

    expect(page).to have_content(comment.body)
    fill_in('comment-form-body', with: 'The best comment in the world')
    click_button 'Create Comment'
    expect(find('#comments')).to have_content('The best comment in the world')
  end
end

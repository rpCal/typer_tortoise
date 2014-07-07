require 'rails_helper'

describe "the home screen", js: true do
  before do
    create(:snippet, full_text: 'hello world')
  end

  it "shows a random snippet" do
    visit root_path
    page.should have_content('hello world')
  end
end

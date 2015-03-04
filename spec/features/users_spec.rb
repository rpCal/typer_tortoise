require 'rails_helper'

describe "users", js: true do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
  end

  describe "index" do
    it "shows a list of users" do
      visit '/users'
      page.should have_content(@user1.name)
      page.should have_content(@user2.name)
    end
  end

  describe "profile" do
    let!(:category) { create(:category, name: 'long obnoxious name') }
    let!(:snippet) { create(:snippet, category: category) }
    let!(:score) { create(:score, snippet: snippet, wpm: 71, user: @user1) }
    it "shows user info and previous scores" do
      visit "/users/#{@user1.id}"

      page.should have_content(@user1.name)
      page.should have_content(snippet.category.name)
      page.should have_content(71)
    end
  end
end

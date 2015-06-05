require 'rails_helper'

describe "snippets index", js: true do
  before do
    @cat_a = create(:category)
    @cat_b = create(:category)
    @snippets = [
      create(:snippet, full_text: 'catAsnip1', category: @cat_a),
      create(:snippet, full_text: 'catAsnip2', category: @cat_a),
      create(:snippet, full_text: 'catBsnip1', category: @cat_b),
    ]
  end

  it "shows all the snippets in the database" do
    visit '/snippets'
    select @cat_a.name
    page.should have_content(/catAsnip1.*catAsnip2/m)

    select @cat_b.name
    page.should have_content(/catBsnip/m)
  end
end

context 'as an admin', js: true do
  let!(:snippet) { create(:snippet, full_text: 'hello world') }

  before do
    admin_user = create(:user, is_admin: true)
    sign_in_with_twitter_as(admin_user)
    page.should have_content(snippet.full_text)
  end

  describe "destroying a snippet" do
    it 'removes the snippet from the database' do
      visit "/snippets"

      select snippet.category.name
      page.should have_content(snippet.full_text)

      expect {
        click_on "Destroy"
        page.should_not have_content(snippet.full_text)
      }.to change(Snippet, :count).by(-1)
    end
  end

  describe "creating a snippet" do
    let!(:category) { create(:category) }

    it 'adds the snippet to the database' do
      visit "/snippets/new"

      select category.name, from: 'Category'
      fill_in 'snippet[full_text]', with: 'interesting code'
      expect {
        click_on 'Create Snippet'
        within 'pre' do
          page.should have_content 'interesting code'
        end
      }.to change(Snippet, :count).by(1)

      Snippet.last.full_text.should == 'interesting code'
    end
  end

  describe "editing a snippet" do
    it 'changes the text of the snippet' do
      visit "/snippets/#{snippet.id}/edit"

      fill_in 'snippet[full_text]', with: 'interesting code'
      click_on 'Update Snippet'
      within 'pre' do
        page.should have_content 'interesting code'
      end

      snippet.reload.full_text.should == 'interesting code'
    end
  end
end

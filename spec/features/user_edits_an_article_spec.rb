require 'rails_helper'

describe 'user edits an article' do
  describe 'they link to from the articles index' do
    it "edits article contents" do

      article = Article.create(title: "This", body: "That")

      visit articles_path
      click_link article.title
      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article))

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"

      click_on "Update Article"

      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
      expect(page).to have_content("Article #{@article.title} Updated!")
    end
  end
end
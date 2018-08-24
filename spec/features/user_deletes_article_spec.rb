require 'rails_helper'

describe 'user deletes an article' do
  describe 'they link from the show page' do
    it 'displays all articles without the deleted entry' do
      article_1 = Article.create!(title: "Heavenly", body: "Things")
      article_2 = Article.create!(title: "Friends", body: "In Low Places")

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)
      expect(page).to have_content("You deleted #{article_1.title}")
    end
  end
end

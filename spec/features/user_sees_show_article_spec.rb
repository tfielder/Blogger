require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the article index' do
    it 'displays information for one article' do
      article = Article.create(title: "Mystery", body: "Some body.")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.)
    end
  end
end

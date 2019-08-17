require 'rails_helper'

feature "Views the quotes home page" do
  context "Given quotes are paginated to 10 per page" do
    context "Given 15 total quotes" do
      scenario "When viewing the first page" do
        15.times do |n|
          create_quote(text: "inspired#{n}!", source: "http://example.com")
        end
        visit quotes_path

        expect(page).to have_content("Next Page")
        expect(page).not_to have_content("Previous Page")
        expect(page).to have_selector("div.quote-summary", count: 10)
      end

      scenario "When viewing the last page" do
        15.times do |n|
          create_quote(text: "inspired#{n}!", source: "http://example.com")
        end
        visit quotes_path(page: 2)

        expect(page).not_to have_content("Next Page")
        expect(page).to have_content("Previous Page")
        expect(page).to have_selector("div.quote-summary", count: 5)
      end
    end
  end

  def create_quote(text:, source: nil, author: nil)
    Quote.create(text: text, source: source, author: author)
  end
end

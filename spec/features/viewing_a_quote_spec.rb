require 'rails_helper'

feature "Viewing a quote page" do
  scenario "When a source is a URL" do
    quote = create_quote(text: "inspired!", source: "http://example.com")

    visit quote_path(quote)

    expect(page).to have_link("source-link")
  end

  scenario "When a source isn't a URL" do
    quote = create_quote(text: "inspired!", source: "IRL")

    visit quote_path(quote)

    expect(page).not_to have_link("source-link")
    expect(page).to have_content("IRL")
  end

  def create_quote(text:, source: nil, author: nil)
    Quote.create(text: text, source: source, author: author)
  end
end

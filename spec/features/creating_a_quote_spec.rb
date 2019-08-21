require 'rails_helper'

feature "Creating a new quote" do
  scenario "Creating a quote with included text" do
    visit new_quote_path

    create_quote(
      text: "Some quote text...",
      source: "The internet",
      author: "Some VC Guru"
    )

    expect(page).to have_current_path(quote_path(Quote.last))
    expect(page).to have_content("Some quote text")
    expect(page).to have_content("The internet")
    expect(page).to have_content("Some VC Guru")
  end

  scenario "Creating a quote without any text" do
    visit new_quote_path

    create_quote(
      source: "The internet",
      author: "Some VC Guru"
    )

    expect(page).to have_content("New Quote")
    expect(page).to have_content("Text can't be blank")
    expect(value_of(field: "quote_source")).to eq("The internet")
    expect(value_of(field: "quote_author")).to eq("Some VC Guru")
  end

  def create_quote(text: nil, source: nil, author: nil)
    fill_in("quote_text", with: text)
    fill_in("quote_source", with: source)
    fill_in("quote_author", with: author)
    click_button("Create")
  end

  def value_of(field:)
    find_field(field).value
  end
end

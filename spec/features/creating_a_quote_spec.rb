require 'rails_helper'

feature "Creating a new quote" do
  scenario "Creating a quote with included text" do
    visit new_quote_path
    fill_in("quote_text", with: "Some quote text...")
    fill_in("quote_source", with: "The internet")
    fill_in("quote_author", with: "Some VC Guru")

    click_button("Create")

    expect(page).to have_current_path(quote_path(Quote.last))
    expect(page).to have_content("Some quote text")
    expect(page).to have_content("The internet")
    expect(page).to have_content("Some VC Guru")
  end

  scenario "Creating a quote without any text" do
    visit new_quote_path
    fill_in("quote_source", with: "The internet")
    fill_in("quote_author", with: "Some VC Guru")

    click_button("Create")

    expect(page).to have_content("New Quote")
    expect(find_field("quote_source").value).to eq("The internet")
    expect(find_field("quote_author").value).to eq("Some VC Guru")
    expect(page).to have_content("Text can't be blank")
  end
end

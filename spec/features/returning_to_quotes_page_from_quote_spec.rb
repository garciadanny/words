require 'rails_helper'

feature "Viewing a quote from the quotes list", js: true do
  scenario "Returns back to the paginated quotes page" do
    quote = create_list(:quote, 15, :with_text)

    visit quotes_path(page: 2)
    find(".open", match: :first).click
    click_link "Back"

    expect(page).to have_current_path quotes_path(page: 2)
  end

  scenario "After editing a quote, includes back button to paginated quotes page" do
    quote = create_list(:quote, 15, :with_text)

    visit quotes_path(page: 2)
    find(".open", match: :first).click
    click_on "Edit"
    fill_in("quote_text", with: "edited text")
    click_on("Update")
    click_on "Back"

    expect(page).to have_current_path quotes_path(page: 2)
  end

  scenario "After canceling to edit a quote, returns back to paginated quotes page" do
    quote = create_list(:quote, 15, :with_text)

    visit quotes_path(page: 2)
    find(".open", match: :first).click
    click_on "Edit"
    click_on "Cancel"
    click_on "Back"

    expect(page).to have_current_path quotes_path(page: 2)
  end

  scenario "After deleting a quote, returns back to the paginated quotes page" do
    quote = create_list(:quote, 15, :with_text)

    visit quotes_path(page: 2)
    find(".open", match: :first).click
    accept_alert do
      click_on "Delete"
    end

    expect(page).to have_current_path quotes_path(page: 2)
  end
end

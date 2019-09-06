require 'rails_helper'

feature "Viewing a quote from the quotes list" do
  scenario "Returns back to the paginated quotes page" do
    quote = create_list(:quote, 15, :with_text)

    visit quotes_path(page: 2)
    find(".open", match: :first).click
    click_link "Back"

    expect(page).to have_current_path quotes_path(page: 2)
  end
end

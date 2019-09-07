require 'rails_helper'

feature "Editing an existing quote" do
  scenario "A user can edit an existing quote" do
   quote = create(:quote, :with_text)

   visit quote_path(quote)
   click_on "Edit"
   fill_in("quote_text", with: "edited text")
   click_button("Update")

   expect(page).to have_current_path(quote_path(quote))
   expect(page).to have_content("edited text")
  end
end

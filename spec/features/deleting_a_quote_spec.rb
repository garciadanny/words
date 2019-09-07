require 'rails_helper'

feature "Deleting an existing quote", js: true do
  scenario "A user can delete an existing quote" do
   quote = create(:quote, :with_text)

   visit quote_path(quote)
   accept_alert do
     click_link("Delete")
   end

   expect(page).to have_current_path(quotes_path)
  end
end

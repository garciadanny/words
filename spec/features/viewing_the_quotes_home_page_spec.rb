require 'rails_helper'

feature "Views the quotes home page" do
  context "Given quotes are paginated to 10 per page" do
    context "Given 15 total quotes" do
      scenario "When viewing the first page" do
        create_quotes(count: 15)

        visit quotes_path

        expect(page).to have_content("Next Page")
        expect(page).not_to have_content("Previous Page")
        expect(page).to have_number_of_quotes(10)
      end

      scenario "When viewing the last page" do
        create_quotes(count: 15)

        visit quotes_path(page: 2)

        expect(page).not_to have_content("Next Page")
        expect(page).to have_content("Previous Page")
        expect(page).to have_number_of_quotes(5)
      end
    end
  end

  def create_quotes(count:)
    create_list(:quote, count, :with_text)
  end

  def have_number_of_quotes(count)
    have_selector("div.quote-summary", count: count)
  end
end

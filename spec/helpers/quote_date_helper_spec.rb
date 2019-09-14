require 'rails_helper'

describe QuoteDateHelper do
  describe ".display_humanized_quote_age" do
    context "when a quote was created within the past 6 days" do
      it "returns the quote's age in amount of days" do
        quote = build_stubbed(:quote, created_at: 5.days.ago)

        quote_age_in_days = QuoteDateHelper.display_humanized_quote_age(quote)

        expect(quote_age_in_days).to eq "5 days ago"
      end
    end

    context "when the quote was created 7 days ago" do
      it "returns the quote's age in amount of weeks" do
        quote = build_stubbed(:quote, created_at: 7.days.ago)

        quote_age = QuoteDateHelper.display_humanized_quote_age(quote)

        expect(quote_age).to eq "One week ago"
      end
    end

    context "When the quote was created over 7 days ago" do
      it "returns the date the quote was created" do
        quote = build_stubbed(:quote, created_at: 10.days.ago)

        quote_age = QuoteDateHelper.display_humanized_quote_age(quote)

        expected_date = quote.created_at.strftime("%B%e, %Y")
        expect(quote_age).to eq expected_date
      end
    end
  end
end

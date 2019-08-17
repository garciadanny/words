require 'rails_helper'

describe Quote do
  describe "#source_is_uri?" do
    context "given a source that is a URL link" do
      it "returns true" do
        quote = Quote.new(source: "http://example.com")

        expect(quote.source_is_url?).to eq(true)
      end
    end

    context "given a soure that isn't a URL link" do
      it "returns false" do
        quote = Quote.new(source: "The Alchemist book")

        expect(quote.source_is_url?).to eq(false)
      end
    end
  end
end

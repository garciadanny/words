module QuoteDateHelper
  extend ActionView::Helpers::DateHelper

  def self.display_humanized_quote_age(quote)
    created_at = quote.created_at

    if created_under_a_week_ago?(created_at)
      "#{time_ago_in_words(created_at)} ago"
    elsif created_a_week_ago?(created_at)
      "One week ago"
    else
      created_at.strftime("%B%e, %Y")
    end
  end

  def self.created_under_a_week_ago?(created_at)
    created_at.to_date >= 6.days.ago.to_date
  end

  def self.created_a_week_ago?(created_at)
    created_at.to_date == 7.days.ago.to_date
  end
end

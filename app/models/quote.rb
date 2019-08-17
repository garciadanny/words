class Quote < ApplicationRecord
  validates :text, presence: true

  def source_is_url?
    url = URI.parse(source)
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  rescue
    false
  end
end

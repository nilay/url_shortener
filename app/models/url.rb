class Url < ApplicationRecord

  before_create :set_slug
  validates :url, presence: true

  def set_slug
    # TODO: optimize this
    loop do
      self.slug = SecureRandom.hex(3)
      break unless Url.where(slug: slug).exists?
    end
  end
end

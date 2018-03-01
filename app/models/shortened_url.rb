require "securerandom"

class ShortenedURL < ApplicationRecord
  include SecureRandom

  validates :short_url, uniqueness: true
  validates :short_url, length: { minimum: 3}

  # attr_accessor :short_url
  # attr_accessor :long_url
#
# def short_url=(url)
#   @short_url = url
# end

  def self.random_code
    while true
      new_url = SecureRandom::urlsafe_base64(7)
      return new_url unless ShortenedURL.exists?(short_url: new_url)
    end
  end

  def self.generate(user, l_url)
    ShortenedURL.create!(short_url: ShortenedURL.random_code, long_url: l_url, user_id: user.id)
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id
end

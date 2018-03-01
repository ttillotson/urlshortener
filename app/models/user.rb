class User < ApplicationRecord
  validates :email, uniqueness: true
  validate :includes_criteria

  def includes_criteria
    unless email.include?("@")
      errors[:email] << "Need a valid email!"
    end
  end

  has_many :submitted_urls,
    class_name: :ShortenedURL,
    primary_key: :id,
    foreign_key: :user_id

end

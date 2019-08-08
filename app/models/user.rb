class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  before_save :downcase_email
  enum role: {customer: 0, admin: 1}
  validates :name, presence: true,
    length: {maximum: Settings.maximum_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.maximum_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.minimum_length_pass}
  validates :address, presence: true,
    length: {maximum: Settings.maximum_length_address}
  validates :phone, presence: true,
    length: {maximum: Settings.maximum_length_phone}

  private

  def downcase_email
    email.downcase!
  end
end

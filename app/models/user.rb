# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password

  validates :password, length: { minimum: 6 }  # ROR Tutorial 7.6.3: `presence` attribute is removed to avoid duplicate error messages.
  validates :password_confirmation, presence: true
  # The API for has_secure_password states: "Validations for presence of password, confirmation of password (using a "password_confirmation" attribute) are automatically added."
  # But the rspec model test fails without the explicit validation for :password_confirmation presence...


  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }

  # Per ROR Tutorial 2nd Ed, listing 6.23: "...not all database adapters use case-sensitive indices"
  before_save { |user| user.email = email.downcase }



end

class User < ApplicationRecord
    has_many :memes
    has_secure_password
    has_secure_token :confirm_token
    has_secure_token :user_token
  
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    #validates :nickname, presence: true
end

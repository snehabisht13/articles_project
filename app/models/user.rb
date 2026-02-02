class User < ApplicationRecord 
    validates :username, presence: true, length: {minimum: 3, maximum: 25} , uniqueness: {case_sensitive: false}
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false}
end
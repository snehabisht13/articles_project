class User < ApplicationRecord 
    before_save {self.email = email.downcase}
    has_many :articles 
    validates :username, presence: true, length: {minimum: 3, maximum: 25} , uniqueness: {case_sensitive: false}
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false}
    has_secure_password
end
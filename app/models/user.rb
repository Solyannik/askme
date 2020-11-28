require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
<<<<<<< HEAD
<<<<<<< HEAD
  VALID_MAIL_REGEXP = URI::MailTo::EMAIL_REGEXP
  VALID_USERNAME_REGEXP = /\A\w+\z/
=======
  MAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  USERNAME = /\A[\w]+\z/
>>>>>>> 672dc05... version 2
=======
  VALID_MAIL_REGEXP = URI::MailTo::EMAIL_REGEXP
  VALID_USERNAME_REGEXP = /\A\w+\z/
>>>>>>> ae31001... Rename constants

  has_many :questions
  before_validation :username_downcase
  before_validation :email_downcase
  before_save :encrypt_password

  attr_accessor :password

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_MAIL_REGEXP }
  validates :username, presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: VALID_USERNAME_REGEXP }
  validates :password, presence: true, on: :create
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  validates_confirmation_of :password
=======
  validates :password
>>>>>>> 672dc05... version 2
=======
  validates_confirmation_of :password
>>>>>>> f966f47... Add styles CSS
=======
  validates :password
>>>>>>> ae31001... Rename constants

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
<<<<<<< HEAD

  private
=======
>>>>>>> 672dc05... version 2

  private

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def username_downcase
    if self.username.present?
      username.downcase!
    end
  end

  def email_downcase
    if self.email.present?
      email.downcase!
    end
  end
end

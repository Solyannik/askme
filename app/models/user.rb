require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  MAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  USERNAME = /\A[\w]+\z/

  has_many :questions
  before_validation :username_downcase
  before_validation :email_downcase
  before_save :encrypt_password

  attr_accessor :password

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: MAIL }
  validates :username, presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: USERNAME }
  validates :password, presence: true, on: :create
  validates_confirmation_of :password

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

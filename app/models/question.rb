class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :manifests
  validates :user, :text, presence: true, length: { maximum: 255 }
end

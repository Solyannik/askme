class Question < ApplicationRecord
  validates :text, :user, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end

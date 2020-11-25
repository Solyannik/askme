class Question < ApplicationRecord

  belongs_to :user
  validates :text, :user, presence: true

  validates :text, length: {maximum: 255, too_long: "%{255} - максимальное количество символов"}
end

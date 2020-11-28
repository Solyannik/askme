class Question < ApplicationRecord
  validates :text, presence: true, length: { maximum: 255 }
end

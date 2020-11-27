class Question < ApplicationRecord
<<<<<<< HEAD

=======
  validates :text, :user, presence: true
>>>>>>> 672dc05... version 2
  validates :text, presence: true, length: { maximum: 255 }
end

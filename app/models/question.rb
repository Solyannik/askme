class Question < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD

=======
  validates :text, :user, presence: true
>>>>>>> 672dc05... version 2
=======

>>>>>>> ae31001... Rename constants
  validates :text, presence: true, length: { maximum: 255 }
end

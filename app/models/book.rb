class Book < ApplicationRecord

  attachment :image
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { maximum: 200 }, presence: true

end

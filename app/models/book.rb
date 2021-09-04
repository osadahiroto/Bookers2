class Book < ApplicationRecord

  attachment :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { maximum: 200 }, presence: true

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end

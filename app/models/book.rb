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

  def self.looks(searches, words)
    if searches == "perfect_match"
      @book = Book.where("title LIKE ?", "#{words}")
    elsif searches == "pertial_match"
      @book = Book.where("title LIKE ?", "%#{words}%")
    elsif searches == "forward_match"
      @book = Book.where("title LIKE ?", "#{words}%")
    elsif searches == "backward_match"
      @book = Book.where("title LIKE ?", "%#{words}")
    else
      @book = Book.all
    end
  end

end

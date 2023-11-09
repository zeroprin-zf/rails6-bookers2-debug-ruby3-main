class Book < ApplicationRecord

  belongs_to :user
  has_one_attached :profile_image #ここ本の画像に代わるかも
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :week_favorites, -> { where(created_at: 1.week.ago.begginning_of_day..Time.current.end_of_day) }
  validates :title,presence:true
  validates :body,presence:true,length:{ maximum:200 }


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
  follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
  following_user.include?(user)
  end


  def self.search_for(search, word)
            if search == 'forward_match'
              @user = User.where('name LIKE?', word+'%')
            elsif search == 'backward_match'
              @user = User.where('name LIKE?','%'+word)
            elsif search == 'perfect_match'
              @user = User.where(name: word)
            elsif search == 'partial_match'
              @user = User.where('name LIKE?','%'+word+'%')
            else
              @user = User.all
            end
  end

  attachment :profile_image

  validates :name, presence: true, length:{ minimum: 2, maximum: 20 }
  validates :introduction, length:{ maximum: 50 }

end

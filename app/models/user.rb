class User < ApplicationRecord

#メールアドレスの小文字化
  before_save { self.email.downcase! }

#バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password


#モデルとの結び付け
  #recordsと結びつけ
  has_many :records
  #relationshipsと結びつけ
  #自分がフォローしているユーザー
  has_many :relationships
  #フォローしているユーザー情報を取得する機能(自分がフォローしているユーザー)
  has_many :followings, through: :relationships, source: :follow
  #自分をフォローしているユーザー
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  #フォローされているユーザーに自分の情報を取得される機能(自分をフォローしているユーザー)
  has_many :followers, through: :reverses_of_relationship, source: :user
  #いいね
  has_many :likes, dependent: :destroy
  has_many :liked_records, through: :likes, source: :record


#ユーザー機能
  #ユーザー画像
  mount_uploader :image, ImageUploader
  #タイムライン
  def feed_records
    Record.where(user_id: self.following_ids + [self.id])
  end

  #渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


#インスタンスメソッド
  #フォロー
  #自分自身でないか
  def follow(other_user)
    unless self == other_user
      #findで見つける, createで保存
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    #フォローがあればアンフォローになる
    relationship.destroy if relationship
  end

  #すでにフォローしているか
  def following?(other_user)
    self.followings.include?(other_user)
  end


  def already_liked?(record)
    self.likes.exists?(record_id: record.id)
  end


end

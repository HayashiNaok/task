class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, dependent: :destroy
  has_many :tools, dependent: :destroy
  has_many :liked_blogs, through: :tools, source: :blog
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  def already_liked?(blog)
    self.likes.exists?(blog_id: blog.id)
  end

  def  nalready_liked?(blog)
    self.likes.exists?(blog_id: blog.id)
  end

  
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :completes, dependent: :destroy
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
end

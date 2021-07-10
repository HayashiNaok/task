class Blog < ApplicationRecord
    belongs_to :user
    
    has_many :tools, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end

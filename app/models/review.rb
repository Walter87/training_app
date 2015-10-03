class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, :user_id, :content, presence:true

  scope :last_five, lambda { order("reviews.created_at DESC").limit(5)}
end

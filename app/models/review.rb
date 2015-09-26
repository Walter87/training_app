class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, :user_id, :content, presence:true
end

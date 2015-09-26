class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews
  validates :price, :title, :description, presence:true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
  	counter = 0
  	self.reviews.each do |review|
  		counter += review.rating
  	end
  	counter.to_f / reviews.count
  end
end

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :price, :title, :description, presence:true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
  	counter = 0
  	self.reviews.each do |review|
  		counter += review.rating
  	end
  	counter.to_f / reviews.count
  end

  def color_values
    val = self.average_rating
    a=[]
    case val
      when 1
        a[0] = 20
        a[1] = 0
        a[2] = 0
        a[3] = 0
        a[4] = 0 
      when 1..2
        a[0] = 20
        a[1] = 20*(val-1)
        a[2] = 0
        a[3] = 0
        a[4] = 0 
      when 2..3
        a[0] = 20
        a[1] = 20
        a[2] = 20*(val-2)
        a[3] = 0
        a[4] = 0   
      when 3..4
        a[0] = 20
        a[1] = 20
        a[2] = 20
        a[3] = 20*(val-3)
        a[4] = 0 
      when 4..5
        a[0] = 20
        a[1] = 20
        a[2] = 20
        a[3] = 20
        a[4] = 20*(val-4)
      end 
    return a  
  end
end

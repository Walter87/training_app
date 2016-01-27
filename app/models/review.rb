class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, :user_id, :content, presence:true

  scope :last_five, lambda { order("reviews.created_at DESC").limit(5)}

  #Set the right review color
  def color
    case self.rating
      when 1
        "poor"
      when 2
        "mediocre"
      when 3
        "satisfactory"
      when 4
        "good"
      when 5
        "very-good"
    end
  end

end

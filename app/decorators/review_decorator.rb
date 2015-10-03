class ReviewDecorator < Draper::Decorator
  delegate_all

  def author 
  	author = review.user
  	"#{author.firstname} #{author.lastname}"
  end

#Set the right review color
  def color
  	case review.rating
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

#Set the right offset value  
#  def offset
#   (2*review.rating-2).to_s
#  end
end

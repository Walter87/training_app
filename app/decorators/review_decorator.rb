class ReviewDecorator < Draper::Decorator
  delegate_all

  def author 
  	author = review.user
  	"#{author.firstname} #{author.lastname}"
  end

end

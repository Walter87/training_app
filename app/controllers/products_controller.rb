class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :correct_user, only: [:edit, :update]
  
  
  expose(:category)
  expose(:categories)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
   # @categories = Category.all
  end

  def show
  end

  def new
  end

  def edit
    
  end

  def create
    self.product = Product.new(product_params)
    self.product.user_id = current_user.id

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
   # if self.product.valid?
      if self.product.update(product_params)
        redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else

        render action: 'edit'
      end
    # else
     # redirect_to(category_product_url(category, product))
    #end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def correct_user
    if current_user != self.product.user  and !current_user.admin?
      flash[:error] = 'You are not allowed to edit this product.' 
      redirect_to(category_product_url(category, product))
      
    end
    
  end  

end

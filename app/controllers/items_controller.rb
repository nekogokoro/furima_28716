class ItemsController < ApplicationController
  

  def index
    @articles = Article.order(id: "DESC")
                

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
   @article = Article.find(params[:id])
  end
  def edit
    
    @article = Article.find(params[:id])
  end
  def update
    
    
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to item_path
    else
      render :edit
    end
  end
   
   
  private

  def article_params
    params.require(:article).permit(:image, :title, :text, :price,:category_id,:status_id,:shipping_charge_id,:shipping_region_id, :day_until_shipping_id,).merge(user_id: current_user.id)
  end
  

end

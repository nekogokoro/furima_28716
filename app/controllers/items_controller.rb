class ItemsController < ApplicationController
 

  def index
    @articles = Article.all
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
   def checked
    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: {post: item}
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :text, :price,:category_id,:status_id,:shipping_charge_id,:shipping_region_id, :day_until_shipping_id,).merge(user_id: current_user.id)
  end

end

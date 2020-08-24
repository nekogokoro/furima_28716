class PurchasesController < ApplicationController
  before_action :authenticate_user!
  # before_action set_artcle, only:[:index]

  
  def index

    @article = Article.find(params[:item_id])  
    if @article.user.id == current_user.id
      redirect_to root_path
    else
      @purchase = Purchase.new
    end
  end

  
  def create
    @article = Article.find(params[:item_id])  
    @address = ShippingAddress.new(address_params)
    @purchase = Purchase.new(article_id: buy_params[:item_id], user_id: current_user[:id])
    if @purchase.valid?
      if @address.save
        
        pay_item
        @purchase.save

        return redirect_to root_path
      else
        redirect_to items_path(params[:item_id])
      end
    else
      redirect_to items_path(params[:item_id])
    end
  end

  private

  def buy_params
    params.permit(:token, :item_id, :user_id)
  end

  def  address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel,:item_id)
    
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @article.price,
      card: buy_params[:token],
      currency: "jpy"
    )
  end

  # def set_artcle 
    
  #   return redirect_to root_path unless @article.purchase.nil?
  # end

end

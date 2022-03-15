class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :condition_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :category_id, :user).merge(user_id: current_user.id)
  end
end

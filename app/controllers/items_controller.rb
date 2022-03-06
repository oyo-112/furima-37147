class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :price, :condition_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :category_id, :user)
  end
end

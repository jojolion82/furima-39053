class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
 

  def index
    #@items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_cost_id, :delivery_area_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end


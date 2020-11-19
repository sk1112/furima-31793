class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_new_user_session, only: [:new]

  def index
    items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :prefecture_id, :delivery_day_id, :delivery_fee_id, :image).merge(user_id: current_user.id)
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end

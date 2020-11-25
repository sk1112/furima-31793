class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index

  def index
    redirect_to root_path if current_user.id == @item.user.id
    @purchase_record = UserPurchaseRecord.new
  end

  def create
    @purchase_record = UserPurchaseRecord.new(purchase_record_params)
    if @purchase_record.valid?
      pay_item
      @purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    elsif @item.purchase_record.present?
      redirect_to root_path
    end
  end

  def purchase_record_params
    params.require(:user_purchase_record).permit(:postal_code, :prefecture_id, :city, :detailed_address, :apartment, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: @item.user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end

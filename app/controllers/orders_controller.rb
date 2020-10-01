class OrdersController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderShippingAddress.new
    redirect_to root_path if (user_signed_in? && current_user.id == @item.user_id) || @item.order.present?
  end

  def create
    @order = OrderShippingAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :user_id, :postal_code, :prefectures, :city, :address, :building_name, :phone, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

class AddressesController < ApplicationController
  before_action :set_item
  def index
  end

  def create
    @deliver = OrderAddress.new(item_params)
    if @deliver.valid?
      pay_item
      @deliver.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_params
    params.permit(:postal, :city, :prefecture_id, :address1, :address2, :telephone, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_1f38abf596f7688f4338b092" # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: set_item[:price], # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類
    )
  end
end

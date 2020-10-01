class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :city, :prefecture_id, :address1, :address2, :telephone, :item_id, :user_id

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A\d{11}\z/ , message: 'は11桁ハイフンなしで入力してください。' }
    validates :user_id
    validates :item_id

  end

  def save
    item = Item.find(item_id)
    user = User.find(user_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, address1: address1,
                          address2: address2, telephone: telephone, item_id: item.id, user_id: user.id)
    Order.create(item_id: item.id, user_id: user.id)
  end
end

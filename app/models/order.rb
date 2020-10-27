class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalty, :building_name, :details, :tel

  validates :municipalty, :details, presence: true
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-).'}
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :tel, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.'}
    validates :tel, length: { maximum: 11 }
  end

  def save
    user = User.find(current_user.id)
    item = Item.find(:id)
    purchase = Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture: prefecture, municipalty: municipalty, building_name: building_name, details: details, tel: tel, purchase_id: purchase.id)
  end
end
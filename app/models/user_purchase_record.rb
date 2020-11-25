class UserPurchaseRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :apartment,
                :phone_number, :token, :user_id, :item_id, :purchase_record_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, allow_blank: true }, length: { maximum: 8 }
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: 'を選択してください' }
    validates :city
    validates :detailed_address
    validates :phone_number, numericality: { only_integer: true, message: 'はハイフン無しで登録してください', allow_blank: true },
                             format: { with: /\d+/, allow_blank: true }, length: { maximum: 11 }
    validates :token, format: { with: /\d+/, message: 'は正しい値を入力してください', allow_blank: true }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(purchase_record_id: purchase_record.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                           detailed_address: detailed_address, apartment: apartment, phone_number: phone_number)
  end
end

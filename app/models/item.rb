class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :name
    validates :description, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than: 9_999_999 }
    validates :user_id
    validates :image
  end
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :delivery_fee_id
  end
end

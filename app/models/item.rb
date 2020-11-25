class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_one :purchase_record

  with_options presence: true do
    validates :name
    validates :description, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
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

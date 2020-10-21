class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_one_active_hash :category
  has_one_active_hash :condition
  has_one_active_hash :duration
  has_one_active_hash :ship_fee
  has_one_active_hash :ship_source
  has_one :purchase

  validates :image, :name, :description, :category, :condition, :duration, :ship_fee, :ship_source, presence: true
  validates :category_id, :condition_id, :duration_id, :ship_fee_id, :ship_source_id, numericality: { other_than: 0 }
  with_options presence: true do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'half-width number'}
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :comments
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :duration
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  has_one :purchase
  
  validates :image, :name, :description, :category, :condition, :duration, :shipping_fee, :prefecture, :price, presence: true
  validates :category_id, :prefecture_id, numericality: { other_than: 0, message: 'select' }
  validates :condition_id, :duration_id, :shipping_fee_id, numericality: { other_than: 0, message: 'status select' }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'half-width number'}
  validates_inclusion_of :price, in: 300..9_999_999, message: 'is out of setting range'
end
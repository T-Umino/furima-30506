class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalty, :building_name, :details, :tel

  
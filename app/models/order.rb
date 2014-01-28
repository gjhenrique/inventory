class Order < ActiveRecord::Base

  validates_uniqueness_of :barcode, on: :create

  has_many :line_items
  has_many :items, through: :line_items
end

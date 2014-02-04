class Order < ActiveRecord::Base

  validates_uniqueness_of :barcode, on: :create


  has_many :line_items
  has_many :items, through: :line_items

  accepts_nested_attributes_for :line_items, reject_if: :all_blank
end

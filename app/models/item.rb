class Item < ActiveRecord::Base

	validates_uniqueness_of :barcode
	validates_presence_of :name

  has_many :line_items
  has_many :orders, through: :line_items
end

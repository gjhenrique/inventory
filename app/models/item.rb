class Item < ActiveRecord::Base

	# Depois colocar no formato das mensagens
	validates_uniqueness_of :barcode, on: :create
	validates_presence_of :name, on: :create

  has_many :line_items
  has_many :orders, through: :line_items
end

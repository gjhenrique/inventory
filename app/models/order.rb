class Order < ActiveRecord::Base

  validates_uniqueness_of :barcode, on: :create
end

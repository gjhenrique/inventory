require 'test_helper'

class ItemTest < ActiveSupport::TestCase

	def test_not_save_with_empty_name 
		item = Item.new
		assert !item.save, "Cant save with an empty name"
	end

	def test_should_not_contain_equal_barcode
		
		parafuso = items(:parafuso)
		assert parafuso.save

		prego = items(:prego)
		assert !prego.save, "Cant save with equals barcodes"

	end
end

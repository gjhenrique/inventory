class ChangeTypeOfNameAndBarcodeToString < ActiveRecord::Migration
	def change
		change_table :items do |t|
			t.change :name, :string
			t.change :barcode, :string
		end
	end
end

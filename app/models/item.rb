class Item < ActiveRecord::Base

	# Depois colocar no formato das mensagens
	validates_uniqueness_of :barcode, on: :create, message: "Código de Barras deve ser único"
	validates_presence_of :name, on: :create, message: "Nome não pode ser vazio"
end

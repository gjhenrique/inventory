json.array!(@items) do |item|
  json.extract! item, :id, :name, :barcode
  json.url item_url(item, format: :json)
end

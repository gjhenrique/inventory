json.array!(@orders) do |order|
  json.extract! order, :id, :barcode
  json.url order_url(order, format: :json)
end

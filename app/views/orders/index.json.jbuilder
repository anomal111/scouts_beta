json.array!(@orders) do |order|
  json.extract! order, :id, :status, :sum, :payment, :purchase
  json.url order_url(order, format: :json)
end

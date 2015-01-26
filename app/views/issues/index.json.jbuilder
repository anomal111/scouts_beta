json.array!(@issues) do |issue|
  json.extract! issue, :id, :date, :mark, :title, :picture, :volume, :price
  json.url issue_url(issue, format: :json)
end

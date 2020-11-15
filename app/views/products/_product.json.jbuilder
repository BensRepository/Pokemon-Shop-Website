json.extract! product, :id, :name, :description, :stock, :price, :image, :created_at, :updated_at
json.url product_url(product, format: :json)

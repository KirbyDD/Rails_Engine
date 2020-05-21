class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :merchant_id, :unit_price

  attributes :unit_price do |object|
    object.unit_price.to_f / 100
  end
end

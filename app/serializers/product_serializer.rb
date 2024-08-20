class ProductSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :price, :photo
end

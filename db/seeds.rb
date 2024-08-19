# db/seeds.rb

# Clear existing products (optional)
Product.delete_all

# Define sample data with photo attribute
products = [
  { name: 'Product 1', description: 'Description for product 1', price: 100.0, photo: 'https://example.com/product1.jpg' },
  { name: 'Product 2', description: 'Description for product 2', price: 200.0, photo: 'https://example.com/product2.jpg' },
  { name: 'Product 3', description: 'Description for product 3', price: 300.0, photo: 'https://example.com/product3.jpg' },
  { name: 'Product 4', description: 'Description for product 4', price: 400.0, photo: 'https://example.com/product4.jpg' },
  { name: 'Product 5', description: 'Description for product 5', price: 500.0, photo: 'https://example.com/product5.jpg' },
  { name: 'Product 6', description: 'Description for product 6', price: 600.0, photo: 'https://example.com/product6.jpg' },
  { name: 'Product 7', description: 'Description for product 7', price: 700.0, photo: 'https://example.com/product7.jpg' },
  { name: 'Product 8', description: 'Description for product 8', price: 800.0, photo: 'https://example.com/product8.jpg' },
  { name: 'Product 9', description: 'Description for product 9', price: 900.0, photo: 'https://example.com/product9.jpg' },
  { name: 'Product 10', description: 'Description for product 10', price: 1000.0, photo: 'https://example.com/product10.jpg' }
]

# Create products in the database
products.each do |product|
  Product.create!(product)
end

puts "Seeded #{products.size} products."

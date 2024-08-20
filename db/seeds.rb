Product.delete_all

products = [
  { 
    name: 'Disco Sólido 1TB Crucial BX500', 
    description: 'Disco Sólido 1TB Crucial BX500', 
    price: 268900.0, 
    photo: 'https://example.com/crucial_bx500_1tb.jpg' 
  },
  { 
    name: 'Memoria RAM 16GB DDR4 Corsair Vengeance', 
    description: 'Memoria RAM 16GB DDR4 Corsair Vengeance 3200MHz', 
    price: 74900.0, 
    photo: 'https://example.com/corsair_vengeance_16gb.jpg' 
  },
  { 
    name: 'Procesador AMD Ryzen 5 5600X', 
    description: 'Procesador AMD Ryzen 5 5600X 6 núcleos 12 hilos', 
    price: 319900.0, 
    photo: 'https://example.com/amd_ryzen_5600x.jpg' 
  },
  { 
    name: 'Tarjeta Gráfica NVIDIA GeForce RTX 3060', 
    description: 'Tarjeta Gráfica NVIDIA GeForce RTX 3060 12GB GDDR6', 
    price: 459900.0, 
    photo: 'https://example.com/rtx_3060.jpg' 
  },
  { 
    name: 'Disco Duro Externo 2TB WD My Passport', 
    description: 'Disco Duro Externo 2TB WD My Passport USB 3.0', 
    price: 189900.0, 
    photo: 'https://example.com/wd_mypassport_2tb.jpg' 
  },
  { 
    name: 'Monitor LG UltraGear 27GL850', 
    description: 'Monitor Gamer LG UltraGear 27GL850 27" QHD 144Hz', 
    price: 349900.0, 
    photo: 'https://example.com/lg_ultragear_27gl850.jpg' 
  },
  { 
    name: 'Teclado Mecánico Logitech G Pro', 
    description: 'Teclado Mecánico Logitech G Pro RGB Switches GX Blue', 
    price: 129900.0, 
    photo: 'https://example.com/logitech_gpro_keyboard.jpg' 
  },
  { 
    name: 'Mouse Inalámbrico Razer DeathAdder V2', 
    description: 'Mouse Inalámbrico Razer DeathAdder V2 Ergonomic', 
    price: 99900.0, 
    photo: 'https://example.com/razer_deathadder_v2.jpg' 
  },
  { 
    name: 'Auriculares HyperX Cloud II', 
    description: 'Auriculares Gamer HyperX Cloud II con sonido 7.1', 
    price: 129900.0, 
    photo: 'https://example.com/hyperx_cloud_ii.jpg' 
  },
  { 
    name: 'Placa Base MSI B450 TOMAHAWK MAX', 
    description: 'Placa Base MSI B450 TOMAHAWK MAX ATX', 
    price: 189900.0, 
    photo: 'https://example.com/msi_b450_tomahawk_max.jpg' 
  }
];


products.each do |product|
  Product.create!(product)
end

puts "Seeded #{products.size} products."

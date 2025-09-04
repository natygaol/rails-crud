puts "Eliminando restaurantes anteriores..."
Restaurant.destroy_all

puts "Creando restaurantes..."

restaurants = [
  { name: "La Picantería", rating: 5 },
  { name: "Central", rating: 5 },
  { name: "Maido", rating: 5 },
  { name: "El Pan de la Chola", rating: 4 },
  { name: "Roky's", rating: 3 },
  { name: "Pardos Chicken", rating: 4 },
  { name: "La Lucha", rating: 4 }
]

restaurants.each do |attrs|
  Restaurant.create!(attrs)
end

puts "¡Listo! Se crearon #{Restaurant.count} restaurantes."

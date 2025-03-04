# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Lista de usuarios a crear
users = [
  'Diego Mero',
  'Joel Delgado',
  'Luis Macías',
  'Lynn Reina',
  'Ruth Álcivar',
  'Jean Carlos Crespo',
  'Silvia Quiroz',
  'Jennifer Moreira',
  'Yulitza Loor',
  'Sandra Castro'
]

# Crea cada usuario si no existe
users.each do |name|
  unless User.exists?(name: name)
    User.create!(name: name)
    puts "Se creó el usuario: #{name}"
  else
    puts "El usuario #{name} ya existe"
  end
end

puts "Proceso de seed completado!"
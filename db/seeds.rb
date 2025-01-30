# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Limpia los registros existentes para evitar duplicados
User.destroy_all

# Lista de usuarios
users = [
  'Diego Mero',
  'Luis Macias',
  'Ruth Alcivar',
  'Silvia Quiroz',
  'Jennifer Moreira',
  'Joel Delgado',
  'Sandra Castro',
  'Yulixa Loor',
  'Jean Carlos Crespo'
]

# Crea los usuarios
users.each do |name|
  User.create!(name: name)
end

puts "Se crearon #{User.count} usuarios exitosamente!"

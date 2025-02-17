# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Nuevo usuario a crear
new_user = 'Lynn Reyna'

# Solo crea el usuario si no existe
unless User.exists?(name: new_user)
  User.create!(name: new_user)
  puts "Se creó el usuario: #{new_user}"
else
  puts "El usuario #{new_user} ya existe"
end

# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
comment = Comment.create(content: 'Podrian incluir la opcion de adoptar/comprar iguanas?? Quedo atento a sus comentarios, gracias.', user_id: 1)
comment = Comment.create(content: 'Exclente idea esta pagina, al fin una plataforma especialmente para adoptar animalitos. Saludos!!! :)', user_id: 1)
comment = Comment.create(content: 'Todo bien, sin embargo el diseño podria ser mejorado, muy bien. 7/10', user_id: 1)
comment = Comment.create(content: 'Pagina favorita!!! Uwu', user_id: 1)
review = Review.create(puntaje: 4, titulo: 'Confiable, pero misterioso.', cuerpo: 'Acabo de realizar una adopcion con este usuario, todo bien, pero usa lentes de sol dentro de la casa... Pero bien!', user_id: 1)
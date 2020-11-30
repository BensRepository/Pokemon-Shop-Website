# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


#Products
Product.create(name: 'Darkness Ablaze Booster Box', collection: 'Sword & Shield', category: "Booster Box", image: 'boosterbox.jpg')
Product.create(name: 'Rebel Clash Booster Box', collection: 'Sword & Shield', category: "BoosterBox", image: 'boosterbox2.jpg')
Product.create(name: 'Vivid Voltage Booster Box', collection: 'Sword & Shield', category: "Booster Box", image: 'boosterbox3.jpg')
Product.create(name: 'Charizard', collection: 'BaseSet', category: "Trading Card", image: 'charizard.jpg')
Product.create(name: 'Blastiose', collection: 'BaseSet', category: "Trading Card", image: 'blastiose.jpg')
Product.create(name: 'Venusaur', collection: 'BaseSet', category: "Trading Card", image: 'venusaur.jpg')
Product.create(name: 'Jiggly Puff', collection: 'Jungle', category: "Trading Card", image: 'jigglypuff.jpg')
Product.create(name: 'Pokeball Red', collection: 'multiple', category: "Booster Packs", image: 'pokeballred.jpg')
Product.create(name: 'Pokeball Blue', collection: 'multiple', category: "Booster Packs", image: 'pokeballblue.jpg')
Post.create(title:'Welcome to the Fourm!', content: 'Welcome to our fourm! feel free to post any Pokemon news or trades! :D', author: 'PokeBen', date: 2020 )

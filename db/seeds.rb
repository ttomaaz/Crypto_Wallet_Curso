# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
  },

  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
  },

  {
    description: "Litecoin",
    acronym: "LTC",
    url_image: "https://banner2.kisspng.com/20180320/kqq/kisspng-brand-trademark-logo-litecoin-5ab088952b3b84.0667612615215187411771.jpg"
  }
]

coins.each do |coin|  
  Coin.find_or_create_by!(coin)
end

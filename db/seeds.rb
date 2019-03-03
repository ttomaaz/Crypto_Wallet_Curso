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
    url_image: "https://banner2.kisspng.com/20180525/wal/kisspng-litecoin-cryptocurrency-bitcoin-logo-cryptocurrency-5b081f1979b524.5871818715272589054985.jpg"
  },

  {
    description: "Monero",
    acronym: "MNO",
    url_image: "https://www.getmonero.org/press-kit/symbols/monero-symbol-1280.png"
  },

  {
    description: "Zcash",
    acronym: "ZCH",
    url_image: "https://z.cash/wp-content/uploads/2018/09/zcash-icon-fullcolor.png"
  },

  {
    description: "Ripple",
    acronym: "RPP",
    url_image: "https://criptozoom.com/wp-content/uploads/2018/08/ripple.png"
  }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

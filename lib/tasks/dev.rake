require "tty-spinner"

namespace :dev do
  desc "Configura o ambiente de desevolvimento"
  task setup: :environment do
      if Rails.env.development?
          ##Sem dry
          #spinner = TTY::Spinner.new("[:spinner] Apagando DB...")
          #spinner.auto_spin
          #%x(rails db:drop)
          #spinner.success('Concluìdo com sucesso!')

          #spinner = TTY::Spinner.new("[:spinner] Criando DB...")
          #spinner.auto_spin
          #%x(rails db:create)
          #spinner.success('Concluìdo com sucesso!')

          #spinner = TTY::Spinner.new("[:spinner] Migrando DB...")
          #spinner.auto_spin
          #%x(rails db:migrate)
          #spinner.success('Concluìdo com sucesso!')

          #spinner = TTY::Spinner.new("[:spinner] Populando DB...")
          #spinner.auto_spin
          #%x(rails db:seed)
          #spinner.success('Concluìdo com sucesso!')
          ###Com DRY
          #show_spinner("Apagando DB...") do
          #  %x(rails db:drop)
          #end
          #show_spinner("Criando DB...") do
          #  %x(rails db:create)
          #end
          #show_spinner("Migrando DB...") do
          #  %x(rails db:migrate)
          #end
          #show_spinner("Populando DB...") do
          #  %x(rails db:seed)
          #end
          ###Melhorando o DRY
          show_spinner("Apagando DB...") { %x(rails db:drop) }
          show_spinner("Criando DB...") { %x(rails db:create) }
          show_spinner("Migrando DB...")  { %x(rails db:migrate) }
          %x(rails dev:add_mining_types)
          %x(rails dev:add_coins)
        else
          puts "Você não está no ambiente de desevolvimento!"
      end
    end

    desc "Cadastra as Moedas"
    task add_coins: :environment do
      show_spinner("Criando Moedas...") do
        coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png",
            mining_type: MiningType.find_by(acronym: 'PoW') ##procurando dentro do model MiningType o campo acronym: para atribuir ao primeiro elemento do model Coin###
          },

          {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
            mining_type: MiningType.all.sample ##procurando por um elemento aleatorio dentro do model MiningType##
          },

          {
            description: "Litecoin",
            acronym: "LTC",
            url_image: "https://banner2.kisspng.com/20180525/wal/kisspng-litecoin-cryptocurrency-bitcoin-logo-cryptocurrency-5b081f1979b524.5871818715272589054985.jpg",
            mining_type: MiningType.all.sample
          },

          {
            description: "Monero",
            acronym: "MNO",
            url_image: "https://www.getmonero.org/press-kit/symbols/monero-symbol-1280.png",
            mining_type: MiningType.all.sample
          },

          {
            description: "Zcash",
            acronym: "ZCH",
            url_image: "https://z.cash/wp-content/uploads/2018/09/zcash-icon-fullcolor.png",
            mining_type: MiningType.all.sample
          },

          {
            description: "Ripple",
            acronym: "RPP",
            url_image: "https://criptozoom.com/wp-content/uploads/2018/08/ripple.png",
            mining_type: MiningType.all.sample
          }
        ]

        coins.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end
    end

    desc "Cadastra os Tipos de Mineração"
    task add_mining_types: :environment do
      show_spinner("Criando Tipos de Mineração...") do
        mining_types = [
          { description: "Proof of Work", acronym: "PoW" },
          { description: "Proof of Stake", acronym: "PoS"},
          { description: "Pooof of Capacity", acronym: "PoC"}
        ]

        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
        end
      end
    end

    private

    def show_spinner(msg_start, msg_end = "Concluìdo!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield #Aqui vai o bloco de código
      spinner.success("#{msg_end}")
  end
end #end do namespace

namespace :dev do
  desc "Configura o ambiente de desevolvimento"
  task setup: :environment do
    if
      puts %x(rails db:drop db:create db:migrate db:seed)
    else
      puts "Você não está no ambiente de desevolvimento!"
    end    
  end
end

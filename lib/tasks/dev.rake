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
        show_spinner("Populando DB...") { %x(rails db:seed) }
      else
        puts "Você não está no ambiente de desevolvimento!"
    end
    end

    private

    def show_spinner(msg_start, msg_end = "Concluìdo!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield #Aqui vai o bloco de código
      spinner.success("#{msg_end}")
  end
end

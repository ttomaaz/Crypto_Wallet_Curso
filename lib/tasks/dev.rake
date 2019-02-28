require "tty-spinner"

namespace :dev do
  desc "Configura o ambiente de desevolvimento"
  task setup: :environment do
    if Rails.env.development?
      #spinners = TTY::Spinner::Multi.new("[:spinner] top")
      #sp1 = spinners.register "[:spinner] Apagando DB..."
      #sp2 = spinners.register "[:spinner] Criando DB..."
      #sp3 = spinners.register "[:spinner] Migrando DB..."
      #sp4 = spinners.register "[:spinner] Populando DB..."
      #spdone = spinner.success('Concluìdo com sucesso!')

      spinner = TTY::Spinner.new("[:spinner] Apagando DB...")
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success('Concluìdo com sucesso!')

      spinner = TTY::Spinner.new("[:spinner] Criando DB...")
      spinner.auto_spin
      %x(rails db:create)
      spinner.success('Concluìdo com sucesso!')

      spinner = TTY::Spinner.new("[:spinner] Migrando DB...")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success('Concluìdo com sucesso!')

      spinner = TTY::Spinner.new("[:spinner] Populando DB...")
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success('Concluìdo com sucesso!')

    else
      puts "Você não está no ambiente de desevolvimento!"
    end
  end
end

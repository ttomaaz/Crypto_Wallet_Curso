class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome] #params é uma variavel global do Ruby
  end
end

module ApplicationHelper
  def locale
    I18n.locale == :en ? "Estados Unidos" : "Brasil"
  end

  def convtime (us_date)
    us_date.strftime("%d/%m/%Y")
  end

  def ambiente_desenvolvimento
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else Rails.env.test?
      "Teste"
    end
  end
end

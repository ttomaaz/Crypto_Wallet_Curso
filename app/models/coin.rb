class Coin < ApplicationRecord
  belongs_to :mining_type #, optional: true ##Usando o optional: true para na hora da migração do DB ele considere o campo mining_type_id como opcional
end

class Pago < ApplicationRecord
    validates :IdPago, presence: true
    validates :Fecha, presence: true
    validates :ValorPagar, presence: true
    validates :IdAptoFK, presence: true
    validates :Descripcion, presence: true
end

class CreateTablePagos < ActiveRecord::Migration[7.0]
  def change
    create_table :pagos do |t|
      t.string :IdPago
      t.date :Fecha
      t.integer :ValorPagar
      t.string :IdAptoFK
      t.text :Descripcion

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :ibge
      t.timestamps
    end
  end
end

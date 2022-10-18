class CreateResidents < ActiveRecord::Migration[7.0]
  def change
    create_table :residents do |t|
      t.string :full_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.string :birth_date
      t.string :phone_number
      t.boolean :active
      t.timestamps
    end
  end
end

class AddResidentFkToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :resident, foreign_key: true
  end
end

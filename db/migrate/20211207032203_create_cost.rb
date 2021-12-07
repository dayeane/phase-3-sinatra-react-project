class CreateCost < ActiveRecord::Migration[6.1]
  def change
    create_table :costs do |t|
      t.integer :costtable_id
      t.string :costtable_type
      t.references :trip
    end
  end
end

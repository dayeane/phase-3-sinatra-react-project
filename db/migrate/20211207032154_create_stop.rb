class CreateStop < ActiveRecord::Migration[6.1]
  def change
    create_table :stops do |t|
      t.references :trip
      t.string :stop_reason
      t.string :note
    end
  end
end

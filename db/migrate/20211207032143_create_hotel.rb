class CreateHotel < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.references :trip
      t.date :check_in
      t.date :check_out
      t.string :location
    end
  end
end

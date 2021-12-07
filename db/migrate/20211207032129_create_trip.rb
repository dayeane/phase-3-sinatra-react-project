class CreateTrip < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :from
      t.string :to
      t.date :depart_date
      t.integer :budget
    end
  end
end

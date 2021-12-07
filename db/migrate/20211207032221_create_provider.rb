class CreateProvider < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.date :date
      t.references :cost
      t.references :trip
      t.string :note
    end
  end
end

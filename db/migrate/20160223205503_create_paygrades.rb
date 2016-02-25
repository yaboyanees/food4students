class CreatePaygrades < ActiveRecord::Migration
  def change
    create_table :paygrades do |t|
      t.string :rank
      t.string :year
      t.integer :pay

      t.timestamps null: false
    end
  end
end

class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string  :name
      t.boolean :student
      t.boolean :foster
      t.boolean :hmr
      t.boolean :hs
      t.integer :pay
      t.integer :ss
      t.integer :tru
      t.integer :pen
      t.integer :ann
      t.integer :sm
      t.integer :household_id

      t.timestamps null: false
    end
  end
end
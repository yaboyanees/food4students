class CreateOptionals < ActiveRecord::Migration
  def change
    create_table :optionals do |t|
      t.boolean :hl
      t.boolean :indy
      t.boolean :azn
      t.boolean :blk
      t.boolean :pac
      t.boolean :wh
      t.integer :household_id

      t.timestamps null: false
    end
  end
end

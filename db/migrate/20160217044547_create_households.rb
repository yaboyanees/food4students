class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :email
      t.string :filler_name
      t.string :four
      t.string :signature
      t.string :casenum
      t.string :reviewed_by
      t.string :status

      t.timestamps null: false
    end
  end
end

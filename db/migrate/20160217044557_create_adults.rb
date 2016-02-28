class CreateAdults < ActiveRecord::Migration
  def change
    create_table :adults do |t|
	  t.string   :name
	  t.integer  :job
	  t.integer  :cs
	  t.integer  :ret
	  t.integer  :pa
      t.integer  :pen
	  t.integer  :ali
	  t.integer  :se
	  t.integer  :mil
	  t.integer	 :paygrade_id
	  t.integer  :other
	  t.integer  :household_id
	  
      t.timestamps null: false
    end
  end
end


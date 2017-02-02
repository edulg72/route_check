class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :from_name, null: false
      t.float :from_long, null: false
      t.float :from_lat, null: false
      t.string :to_name, null: false
      t.float :to_long, null: false
      t.float :to_lat, null: false
      t.string :created_by

      t.timestamps null: false
    end
  end
end

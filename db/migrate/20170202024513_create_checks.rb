class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.timestamp :date
      t.integer :length
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :checks, :routes
  end
end

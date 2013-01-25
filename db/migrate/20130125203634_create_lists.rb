class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.text :address

      t.timestamps
    end
    add_index :lists, :address
  end
end

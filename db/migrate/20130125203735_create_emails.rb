class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :address

      t.timestamps
    end
    add_index :subscriptions, :address
  end
end

class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :list
      t.references :email

      t.timestamps
    end
    add_index :subscriptions, :list_id
    add_index :subscriptions, :email_id
  end
end

class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :organization_id
      t.boolean :admin

      t.timestamps
    end
  end
end

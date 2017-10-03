class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.text :info
      t.integer :admin_id
      t.timestamps
    end
  end
end
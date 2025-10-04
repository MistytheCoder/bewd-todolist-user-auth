class AddAttributesToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :content, :string
    add_column :users, :completed, :boolean, default: false
  end
end

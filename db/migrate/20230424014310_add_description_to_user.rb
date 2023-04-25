class AddDescriptionToUser < ActiveRecord::Migration[7.0]
  def change
    #addition of two new columns to the table users
    add_column :users , :bio,:string
    add_column :users, :username, :string
  end
end

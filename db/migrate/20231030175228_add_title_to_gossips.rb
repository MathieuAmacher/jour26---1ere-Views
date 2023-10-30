class AddTitleToGossips < ActiveRecord::Migration[7.1]
  def change

      add_column :gossips, :title, :string
  
  end
end

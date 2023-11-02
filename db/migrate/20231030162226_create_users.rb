class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.belongs_to :gossip, index: true
      t.timestamps
    end
  end
end

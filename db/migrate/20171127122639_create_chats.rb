class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|

      t.timestamps
    end
    add_column :chats, :sender_id, :integer, index: true
    add_column :chats, :receiver_id, :integer, index: true

    add_foreign_key :chats, :users, column: :sender_id
    add_foreign_key :chats, :users, column: :receiver_id
  end
end

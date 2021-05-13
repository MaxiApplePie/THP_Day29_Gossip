class AddLinkPm < ActiveRecord::Migration[5.2]
  def change
    add_reference :private_messages, :recipient, foreign_key: { to_table: :users }
    add_reference :private_messages, :sender, foreign_key: { to_table: :users }
  end
end

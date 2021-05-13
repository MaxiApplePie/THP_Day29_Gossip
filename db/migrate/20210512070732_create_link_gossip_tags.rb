class CreateLinkGossipTags < ActiveRecord::Migration[5.2]
  def change
    create_table :link_gossip_tags do |t|

      t.timestamps
    end
  end
end

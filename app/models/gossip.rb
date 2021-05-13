class Gossip < ApplicationRecord
  belongs_to :user
  has_many :link_gossip_tags
  has_many :tags, through: :link_gossip_tags
end

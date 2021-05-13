class Tag < ApplicationRecord
  has_many :link_gossip_tags
  has_many :gossips, through: :link_gossip_tags
end

class StaticController < ApplicationController
  def index
    puts "_" * 60
    puts login_path
    @gossips = Gossip.all
  end

  def welcome
  end

  def team
  end

  def contact
  end

  def login
  end

  def author
  end
end

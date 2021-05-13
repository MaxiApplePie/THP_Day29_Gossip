class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    if (current_user)
      # @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by_first_name("anonymous"))
      @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
      if @gossip.save
        redirect_to "/index"
        flash[:alert] = "Gossip Saved!!"
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      else
        render "new"
      end
    else
      redirect_to "/login"
    end
  end

  def edit
    #     Prefix Verb   URI Pattern                    Controller#Action
    #edit_gossip GET    /gossips/:id/edit(.:format)    gossips#edit
    # ************************************************************
    # {"controller"=>"gossips", "action"=>"edit", "id"=>"37"}
    # ************************************************************
    @gossip = Gossip.find(params[:id])
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(post_params)
    redirect_to index_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to index_path
  end

  private

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end
end

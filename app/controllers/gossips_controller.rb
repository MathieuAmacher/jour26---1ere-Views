class GossipsController < ApplicationController


  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    puts params.inspect
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: User.all.sample.id)

    if @gossip.save
      redirect_to gossips_path, notice: 'Gossip was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[gossip_params])
    puts gossip.params.inspect
    gossip.params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  # Other actions (show, edit, update, destroy) can remain as they are.

  private

  def gossip_params
    params.require(:gossip).permit(:content, :title)
  end
end

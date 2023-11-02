class GossipsController < ApplicationController


  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])  
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(title: params['title'], content: params['content'], user_id: User.all.sample.id)
    @gossip.user = User.find_by(id: session[:user_id])

    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to "/", notice: 'Gossip was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to "/"

  end

  def destroy
    @gossip = Gossip.find_by([:id])
    @gossip.destroy
    redirect_to "/"
  end
  

  private

  def gossip_params
    params.require(:gossip).permit(:content, :title)
  end
end

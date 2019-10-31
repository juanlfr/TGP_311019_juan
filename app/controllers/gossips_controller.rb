class GossipsController < ApplicationController
  
	def show 
		@gossip = Gossip.find(params[:id])
    @city = City.find(@gossip.user.city_id)
	end

	def new
		@gossip = Gossip.new
	end


  def create 
 		@gossip = Gossip.new('title' => params[:title],
                  			 'content' => params[:content],
                  			 'user_id' => 1
                  			 )
   		if @gossip.save # essaie de sauvegarder en base @gossip
     		 redirect_to "welcome/index"
	    else
  		   render "new"
    	end
  end

  def edit 
    @gossip = Gossip.find(params[:id])
  end


  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title],
                      content: params[:content])
      redirect_to gossip_path
    else
      render :edit
    end
  end


  def destroy 
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    render "welcome/index"
  end

end
 
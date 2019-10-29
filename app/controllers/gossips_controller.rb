class GossipsController < ApplicationController
  
	def show 
		@gossip = Gossip.find(params[:id])
	end

	def new
		@gossip = Gossip.new
	end

  def create 
 			@gossip = Gossip.new('title' => params[:title],
                  			 'content' => params[:content],
                  			 'user_id' => 51
                  			 )
   		if @gossip.save # essaie de sauvegarder en base @gossip
     		 render "welcome/index"
	    else
  		   render "new"
    	end
  end

end
 
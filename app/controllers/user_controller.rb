class UserController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  	@city = City.find(@user.city_id)
  end

  def new
    @user = User.new
  end

  def create
    @city = City.create(name: params[:city_name], zip_code: params[:zip_code])
    
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], age: params[:age], description: params[:description], city_id: @city.id)

  
    
    if @city.save && @user.save # essaie de sauvegarder en base @gossip
      log_in(@user)
      redirect_to welcome_index_path(:id)

    else
     render new_user_path
    end

  end

end

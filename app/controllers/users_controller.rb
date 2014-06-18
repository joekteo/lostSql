class UsersController < ApplicationController

  def index
    @users = params[:ids] ?
      User.where(id: params[:ids].split(",")).to_a :
      User.all.to_a
  end

  def create_or_replace
    if user = User.find_by( id: params[:id] )
      replacement= User.new(
          user_params.merge( id: params[:id] )
        )
      if replacement.valid?
        user.destroy
        replacement.save
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      if user = User.create(
          user_params.merge( id: params[:id] )
        )
        render json: user, status: :created
      else
        head :unprocessable_entity
      end
    end

  end

  def update
    if user = User.find_by( id: params[:id] )
      if user.update_attributes( user_params )
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    if user = User.find_by( id: params[:id] )
      if user.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  protected

  def user_params
    params.require(:user).permit( :title, :body )
  end
end
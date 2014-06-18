class TagsController < ApplicationController

  def index
    @tags = params[:ids] ?
      Tag.where(id: params[:ids].split(",")).to_a :
      Tag.all.to_a
  end

  def create_or_replace
    if tag = Tag.find_by( id: params[:id] )
      replacement= Tag.new(
          tag_params.merge( id: params[:id] )
        )
      if replacement.valid?
        tag.destroy
        replacement.save
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      if tag = Tag.create(
          tag_params.merge( id: params[:id] )
        )
        render json: tag, status: :created
      else
        head :unprocessable_entity
      end
    end

  end

  def update
    if tag = Tag.find_by( id: params[:id] )
      if tag.update_attributes( tag_params )
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    if tag = Tag.find_by( id: params[:id] )
      if tag.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  protected

  def tag_params
    params.require(:tag).permit( :title, :body )
  end
end
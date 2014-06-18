class CommentsController < ApplicationController

  def index
    @comments = params[:ids] ?
      Comment.where(id: params[:ids].split(",")).to_a :
      Comment.all.to_a
  end

  def create_or_replace
    if comment = Comment.find_by( id: params[:id] )
      replacement= Comment.new(
          comment_params.merge( id: params[:id] )
        )
      if replacement.valid?
        comment.destroy
        replacement.save
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      if comment = Comment.create(
          comment_params.merge( id: params[:id] )
        )
        render json: comment, status: :created
      else
        head :unprocessable_entity
      end
    end

  end

  def update
    if comment = Comment.find_by( id: params[:id] )
      if comment.update_attributes( comment_params )
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    if comment = Comment.find_by( id: params[:id] )
      if comment.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  protected

  def comment_params
    params.require(:comment).permit( :title, :body )
  end
end
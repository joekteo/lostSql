class ArticlesController < ApplicationController

  def index
    @articles = params[:ids] ?
      Article.where(id: params[:ids].split(",")).to_a :
      Article.all.to_a
  end

  def create_or_replace
    if article = Article.find_by( id: params[:id] )
      replacement= Article.new(
          article_params.merge( id: params[:id] )
        )
      if replacement.valid?
        article.destroy
        replacement.save
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      if article = Article.create(
          article_params.merge( id: params[:id] )
        )
        render json: article, status: :created
      else
        head :unprocessable_entity
      end
    end

  end

  def update
    if article = Article.find_by( id: params[:id] )
      if article.update_attributes( article_params )
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    if article = Article.find_by( id: params[:id] )
      if article.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  protected

  def article_params
    params.require(:article).permit( :title, :body )
  end
end
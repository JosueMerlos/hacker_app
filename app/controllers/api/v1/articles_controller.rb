class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.search(index_params[:search])
    from_date = Date.parse(index_params[:date]) rescue nil
    @articles = @articles.from_date(from_date) if from_date.present?

    render formats: :json
  end

  def show
    @article = Article.find_by(record_id: show_params[:id])

    render formats: :json
  end

  def update
    @article = Article.find_by(record_id: update_params[:id])
    @article.attributes = update_params.except(:id).permit!
    
    if @article.save
      render :show
    else
      render json: { errors: @article.errors.full_messages.join(', ') }, status: :ok
    end
  end

  def destroy
    @article = Article.find_by(record_id: destroy_params[:id])
    message = 'Item successfully removed'
    message = @article.errors.full_messages.join(', ') unless @article.destroy
    render json: { message: message }, status: :ok
  end

  private
  
  def index_params
    params.permit(:search, :date, :page, :per_page)
  end

  def show_params
    params.permit(:id)
  end

  def update_params
    params.permit(:id, :title, :url, :comment_text, :story_title, :story_url)
  end

  def destroy_params
    params.permit(:id)
  end
end

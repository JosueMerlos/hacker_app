total_count = @articles.length
json.articles @articles.paginate(page: params[:page], per_page: params[:per_page]) do |article|
  json.partial! 'shared/body_article', article: article
end
json.partial! 'shared/pagination', page: params[:page], per_page: params[:per_page], total_count: total_count
json.articles @articles do |article|
  json.partial! 'shared/body_article', article: article
end

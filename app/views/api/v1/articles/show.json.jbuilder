json.partial! 'shared/body_article', article: @article
json.children @article.children, partial: 'shared/body_article', as: :article

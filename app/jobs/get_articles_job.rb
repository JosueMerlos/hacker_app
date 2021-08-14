class GetArticlesJob < ApplicationJob
  queue_as :default

  def perform
    Sidekiq.logger.info 'Ejecutando GetArticlesJob....'
    ::GetArticles.init
  end
end

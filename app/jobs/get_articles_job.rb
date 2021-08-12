class GetArticlesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ::GetArticles.init
  end
end

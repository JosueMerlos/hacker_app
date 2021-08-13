class GetArticles

  def self.init
    articles = []
    # &hitsPerPage=200
    response = HTTParty.get('http://hn.algolia.com/api/v1/search_by_date?query=ruby&hitsPerPage=200')
    articles = response['hits'] if response.code.eql?(200)

    articles.each do |article|
      next if Article.exists?(record_id: article['objectID'])

      record = Article.new(
        record_id: article['objectID'],
        title: article['title'],
        url: article['url'],
        author: article['author'],
        points: article['points'],
        comment_text: article['comment_text'],
        num_comments: article['num_comments'],
        story_id: article['story_id'],
        story_title: article['story_title'],
        story_url: article['story_url'],
        parent_id: article['parent_id'],
        publish_date: article['created_at'],
        tag: article['_tags'][0]
      )

      record.save
    end

    "Se procesaron #{articles.length} registros!!!"
  end

end

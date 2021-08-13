FactoryBot.define do
  factory :article_1, class: Article do
    record_id      { '28142765' }
    title          { 'We migrated ToolJet server from Ruby to Node.js' }
    url            { 'https://blog.tooljet.io/how-we-migrated-tooljet' }
    author         { 'navaneethpk' }
    points         { 4 }
    num_comments   { 1 }
    publish_date   { '2021-08-10 14:56:06' }
    tag            { 'story' }
  end

  factory :article_2, class: Article do
    record_id      { '28046468' }
    title          { 'A multithreaded, Postgres-based' }
    url            { 'https://github.com/bensheldon/good_job' }
    author         { 'damir' }
    points         { 1 }
    num_comments   { 0 }
    publish_date   { '2021-08-11 15:56:06' }
    tag            { 'story' }
  end

  factory :article_3, class: Article do
    record_id      { '28125042' }
    author         { 'PragmaticPulp' }
    comment_text   { 'Comment text example' }
    story_id       { '28142765' }
    story_title    { 'Story title example' }
    story_url      { 'https://nibblestew.blogspot.com/2021/02/story_example' }
    parent_id      { '28142765' }
    publish_date   { '2021-08-10 04:04:41' }
    tag            { 'comment' }
  end
end

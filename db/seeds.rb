# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Article.count.zero?
  Article.create(
    record_id: '28142765',
    title: 'We migrated ToolJet server from Ruby to Node.js',
    url: 'https://blog.tooljet.io/how-we-migrated-tooljet',
    author: 'navaneethpk',
    points: 4,
    num_comments: 1,
    publish_date: '2021-08-10 14:56:06',
    tag: 'story'
  )

  Article.create(
    record_id: '28046468',
    title: 'A multithreaded, Postgres-based',
    url: 'https://github.com/bensheldon/good_job',
    author: 'damir',
    points: 1,
    num_comments: 0,
    publish_date: '2021-08-11 15:56:06',
    tag: 'story'
  )

  Article.create(
    record_id: '28125042',
    author: 'PragmaticPulp',
    comment_text: 'Comment text example',
    story_id: '28142765',
    story_title: 'Story title example',
    story_url: 'https://nibblestew.blogspot.com/2021/02/story_example',
    parent_id: '28142765',
    publish_date: '2021-08-10 04:04:41',
    tag: 'comment'
  )
end

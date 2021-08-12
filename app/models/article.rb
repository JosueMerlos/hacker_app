class Article < ApplicationRecord
  validates :publish_date, presence: true
  validates :object_id, presence: true
  validates :tag, presence: true

  scope :stories, -> { where(tag: 'story') }
  scope :comments, -> { where(tag: 'comment') }
  scope :from_date, ->(date) { where('publish_date >= ?', date) }
  scope :by_parent, ->(parent_id) { where(parent_id: parent_id) }
  
  def self.search(text)
    where('title ilike :text or story_title ilike :text or comment_text ilike :text',
          text: ['%', text.strip, '%'].join)
  end

  def children
    self.class.by_parent(object_id)
  end
end

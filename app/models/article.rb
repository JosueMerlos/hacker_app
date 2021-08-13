class Article < ApplicationRecord
  validates :publish_date, presence: true
  validates :record_id, presence: true, uniqueness: true
  validates :tag, presence: true

  scope :stories, -> { where(tag: 'story') }
  scope :comments, -> { where(tag: 'comment') }
  scope :from_date, ->(date) { where('publish_date::date = ?', date.to_date) }
  scope :by_parent, ->(parent_id) { where(parent_id: parent_id) }
  
  def self.search(text)
    text.try(:strip!)
    where('title ilike :text or story_title ilike :text', text: ['%', text, '%'].join)
  end

  def children
    self.class.by_parent(record_id)
  end
end

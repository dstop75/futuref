class Resource < ActiveRecord::Base
  belongs_to :topic
  # has_many :comments

  validates :name, presence: true
  validates :url, presence: true
  validates :topic_id, presence: true
end

class Resource < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :url, presence: true
  validates :topic_id, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, uniqueness: { case_sensitive: false }
end

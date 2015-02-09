class Comment < ActiveRecord::Base
  belongs_to :resource

  validates :message, presence: true
  validates :resource_id, presence: true
end

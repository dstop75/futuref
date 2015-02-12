class Topic < ActiveRecord::Base
  has_many :resources, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end

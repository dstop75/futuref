require 'rails_helper'

RSpec.describe Comment do
  describe '.create' do
    topic = Topic.create!(name: 'Heroku')
    resource = Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)

    it 'creates a new comment' do
      expect(Comment.create()).to be_a Comment
    end

    it 'is invalid without a message' do
      expect(Comment.create(resource: resource)).not_to be_valid
    end

    it 'is invalid without a resource_id' do
      expect(Comment.create(message: 'Deploying to Heroku')).not_to be_valid
    end

    # it 'is valid with a message and a resource_id' do
    #   expect(Comment.create(message: 'Deploying to Heroku', resource: resource)).to be_valid
    # end
  end
end

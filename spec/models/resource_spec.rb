require 'rails_helper'

RSpec.describe Resource do
  describe '.create' do
    let(:topic) { Topic.create!(name: 'Heroku') }

    it 'creates a new resource' do
      expect(Resource.create()).to be_a Resource
    end

    it 'is invalid without a name' do
      expect(Resource.create(url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)).not_to be_valid
    end

    it 'is invalid without a url' do
      expect(Resource.create(name: 'Deploying to Heroku', topic: topic)).not_to be_valid
    end

    it 'is invalid without a topic_id' do
      expect(Resource.create(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku')).not_to be_valid
    end

    it 'is valid with a name, url and topic_id' do
      expect(Resource.create(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)).to be_valid
    end
  end
end

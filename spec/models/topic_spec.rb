require 'rails_helper'

RSpec.describe Topic do
  describe '.create' do
    it 'creates a new topic' do
      expect(Topic.create()).to be_a Topic
    end

    it 'is invalid without a name' do
      expect(Topic.create()).not_to be_valid
    end

    it 'is valid with a name' do
      expect(Topic.create(name: 'Topic name')).to be_valid
    end
  end
end

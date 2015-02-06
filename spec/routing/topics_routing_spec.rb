require 'rails_helper'

RSpec.describe 'routes for topics' do
  it 'routes GET /topics to the topics controller' do
    expect(get('/topics')).to route_to('topics#index')
  end

  # it 'routes GET /topics/new to the topics controller' do
  #   expect(get('/topics/new')).to route_to('topics#new')
  # end

  # it 'routes POST /topics to the topics controller' do
  #   expect(post('/topics')).to route_to('topics#create')
  # end

  # it 'routes GET /topics/1 to the topics controller and sets id' do
  #   expect(get('/topics/1')).to route_to(
  #     controller: 'topics',
  #     action: 'show',
  #     id: '1'
  #   )
  # end

  # it 'routes GET /topics/1/edit to the topics controller and sets id' do
  #   expect(get('topics/1/edit')).to route_to(
  #     controller: 'topics',
  #     action: 'edit',
  #     id: '1'
  #   )
  # end

  # it 'routes PATCH /topics/1 to the topics controller and sets id' do
  #   expect(patch('topics/1')).to route_to(
  #     controller: 'topics',
  #     action: 'update',
  #     id: '1'
  #   )
  # end

  # it 'routes DELETE /topics/1 to the topics controller and sets id' do
  #   expect(delete('topics/1')).to route_to(
  #     controller: 'topics',
  #     action: 'destroy',
  #     id: '1'
  #   )
  # end
end

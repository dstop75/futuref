require 'rails_helper'

RSpec.describe 'routes for resources' do
  # it 'routes GET /topics/:topic_id/resources to the resources controller' do
  #   expect(get('/topics/1/resources')).to route_to('resources#index', topic_id: '1')
  # end

  it 'routes GET /topics/:topic_id/resources/new to the resources controller' do
    expect(get('/topics/1/resources/new')).to route_to('resources#new', topic_id: '1')
  end

  it 'routes POST /topics/:topic_id/resources to the resources controller' do
    expect(post('/topics/1/resources')).to route_to('resources#create', topic_id: '1')
  end

  # it 'routes GET /resources/:id to the resources controller and sets id' do
  #   expect(get('/resources/1')).to route_to(controller: 'resources', action: 'show', id: '1')
  # end

  it 'routes GET /resources/:id/edit to the resources controller and sets id' do
    expect(get('resources/1/edit')).to route_to(controller: 'resources', action: 'edit', id: '1')
  end

  it 'routes PATCH /resources/:id to the resources controller and sets id' do
    expect(patch('resources/1')).to route_to(controller: 'resources', action: 'update', id: '1')
  end

  it 'routes DELETE /resources/:id to the resources controller and sets id' do
    expect(delete('resources/1')).to route_to(controller: 'resources', action: 'destroy', id: '1')
  end
end

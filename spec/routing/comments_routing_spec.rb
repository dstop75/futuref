require 'rails_helper'

RSpec.describe 'routes for comments' do
  # it 'routes GET /resources/:resource_id/comments to the comments controller' do
  #   expect(get('/resources/1/comments')).to route_to('comments#index', resource_id: '1')
  # end

  it 'routes GET /resources/:resource_id/comments/new to the comments controller' do
    expect(get('/resources/1/comments/new')).to route_to('comments#new', resource_id: '1')
  end

  it 'routes POST /resources/:resource_id/comments to the comments controller' do
    expect(post('/resources/1/comments')).to route_to('comments#create', resource_id: '1')
  end

  # it 'routes GET /comments/:id to the comments controller and sets id' do
  #   expect(get('/comments/1')).to route_to(controller: 'comments', action: 'show', id: '1')
  # end

  it 'routes GET /comments/:id/edit to the comments controller and sets id' do
    expect(get('comments/1/edit')).to route_to(controller: 'comments', action: 'edit', id: '1')
  end

  it 'routes PATCH /comments/:id to the comments controller and sets id' do
    expect(patch('comments/1')).to route_to(controller: 'comments', action: 'update', id: '1')
  end

  it 'routes DELETE /comments/:id to the comments controller and sets id' do
    expect(delete('comments/1')).to route_to(controller: 'comments', action: 'destroy', id: '1')
  end
end

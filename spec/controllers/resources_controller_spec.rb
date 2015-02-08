require 'rails_helper'

RSpec.describe ResourcesController do
  let(:topic) { Topic.create(name: "topic name") }
  let(:valid_attributes) {
    { name: "Here's a resource name", url: "http://www.google.com", topic_id: topic.id }
  }

  let(:invalid_attributes) {
    { name: nil, url: nil, topic_id: nil }
  }

  # describe 'GET index' do

  #   it 'has a 200 status code' do
  #     get :index, topic_id: topic.id
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the index template' do
  #     get :index, topic_id: topic.id
  #     expect(response).to render_template('index')
  #   end

  #   it 'assigns @resources' do
  #     resources = topic.resources

  #     get :index, topic_id: topic.id
  #     expect(assigns(:resources)).to eq resources
  #   end
  # end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new, topic_id: topic.id
      expect(response.status).to eq 200
    end

  #   it 'renders the new template' do
  #     get :new, topic_id: topic.id
  #     expect(response).to render_template('new')
  #   end

  #   it 'assigns @resource' do
  #     get :new, topic_id: topic.id
  #     expect(assigns(:resource)).to be_a_new Resource
  #   end
  end

  # describe 'GET show' do
  #   it 'has a 200 status code' do
  #     resource = Resource.create!(valid_attributes)
  #     get :show, id: resource
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the show template' do
  #     resource = Resource.create!(valid_attributes)
  #     get :show, id: resource
  #     expect(response).to render_template('show')
  #   end

  #   it 'assigns @resource' do
  #     resource = Resource.create!(valid_attributes)
  #     get :show, id: resource
  #     expect(assigns(:resource)).to eq resource
  #   end
  # end

  # describe 'POST create' do
  #   context 'with valid attributes' do
  #     it 'saves a new resource' do
  #       expect {
  #         post :create, topic_id: topic.id, resource: valid_attributes
  #       }.to change(Resource, :count).by 1
  #     end

  #     it 'assigns @resource' do
  #       post :create, topic_id: topic.id, resource: valid_attributes
  #       expect(assigns(:resource)).to be_a Resource
  #       expect(assigns(:resource)).to be_persisted
  #     end

  #     it 'redirects to the created topic' do
  #       post :create, topic_id: topic.id, resource: valid_attributes
  #       expect(response).to redirect_to(Resource.last)
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'assigns @resource, but does not save a new resource' do
  #       post :create, topic_id: topic.id, resource: invalid_attributes
  #       expect(assigns(:resource)).to be_a_new Resource
  #     end

  #     it 're-renders the new template' do
  #       post :create, topic_id: topic.id, resource: invalid_attributes
  #       expect(response).to render_template 'new'
  #     end
  #   end
  # end

  # describe 'GET edit' do
  #   it 'has a 200 status code' do
  #     resource = Resource.create!(valid_attributes)
  #     get :edit, id: resource
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the edit template' do
  #     resource = Resource.create!(valid_attributes)
  #     get :edit, id: resource
  #     expect(response).to render_template('edit')
  #   end

  #   it 'assigns @resource' do
  #     resource = Resource.create!(valid_attributes)
  #     get :edit, id: resource
  #     expect(assigns(:resource)).to eq resource
  #   end
  # end

  # describe 'PATCH update' do
  #   context 'with valid attributes' do
  #     let(:new_attributes) { { body: 'a new body!' } }

  #     it 'updates the requested resource' do
  #       resource = Resource.create!(valid_attributes)
  #       patch :update, id: resource, resource: new_attributes
  #       resource.reload
  #       expect(resource.body).to eq new_attributes[:body]
  #     end

  #     it 'assigns @resource' do
  #       resource = Resource.create!(valid_attributes)
  #       patch :update, id: resource, resource: new_attributes
  #       expect(assigns(:resource)).to eq resource
  #     end

  #     it 'redirects to the resource' do
  #       resource = Resource.create!(valid_attributes)
  #       patch :update, id: resource, resource: new_attributes
  #       expect(response).to redirect_to resource
  #     end
  #   end

  #   context 'with invalid_attributes' do
  #     it 'assigns @resource' do
  #       resource = Resource.create!(valid_attributes)
  #       patch :update, id: resource, resource: invalid_attributes
  #       expect(assigns(:resource)).to eq resource
  #     end

  #     it 're-renders the edit template' do
  #       resource = Resource.create!(valid_attributes)
  #       patch :update, id: resource, resource: invalid_attributes
  #       expect(response).to render_template('edit')
  #     end
  #   end
  # end

  # describe 'DELETE destroy' do
  #   it 'destroys the requested resource' do
  #     resource = Resource.create!(valid_attributes)
  #     expect {
  #       delete :destroy, id: resource
  #     }. to change(Resource, :count).by(-1)
  #   end

  #   it 'redirects to the resources list' do
  #     resource = Resource.create!(valid_attributes)
  #     topic_id = resource.topic_id
  #     delete :destroy, id: resource
  #     expect(response).to redirect_to topic_resources_url(topic_id)
  #   end
  # end
end

require 'rails_helper'

RSpec.describe TopicsController do
  let(:valid_attributes) {
    { name: 'Relational Databases' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @topics' do
      topics = Topic.all
      get :index
      expect(assigns(:topics)).to eq topics
    end
  end

  # describe 'GET new' do
  #   it 'has a 200 status code' do
  #     get :new
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the new template' do
  #     get :new
  #     expect(response).to render_template('new')
  #   end

  #   it 'assigns @topic' do
  #     get :new
  #     expect(assigns(:topic)).to be_a_new Topic
  #   end
  # end

  # describe 'GET show' do
  #   it 'has a 200 status code' do
  #     topic = Topic.create!(valid_attributes)
  #     get :show, id: topic
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the show template' do
  #     topic = Topic.create!(valid_attributes)
  #     get :show, id: topic
  #     expect(response).to render_template('show')
  #   end

  #   it 'assigns @topic' do
  #     topic = Topic.create!(valid_attributes)
  #     get :show, id: topic
  #     expect(assigns(:topic)).to eq topic
  #   end
  # end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new topic' do
        expect {
          post :create, topic: valid_attributes
        }.to change(Topic, :count).by 1
      end

      it 'assigns @topic' do
        post :create, topic: valid_attributes
        expect(assigns(:topic)).to be_a Topic
        expect(assigns(:topic)).to be_persisted
      end

      it 'redirects to topics#index' do
        post :create, topic: valid_attributes
        expect(response).to redirect_to topics_url
      end
    end

    context 'with invalid attributes' do
      it 'assigns @topic' do
        post :create, topic: invalid_attributes
        expect(assigns(:topic)).to be_a Topic
      end

      it 'does not save a new topic' do
        expect {
          post :create, topic: invalid_attributes
        }.to change(Topic, :count).by 0
      end

  #     it 're-renders the new template' do
  #       post :create, topic: invalid_attributes
  #       expect(response).to render_template 'new'
  #     end
    end
  end

  # describe 'GET edit' do
  #   it 'has a 200 status code' do
  #     topic = Topic.create!(valid_attributes)
  #     get :edit, id: topic
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the edit template' do
  #     topic = Topic.create!(valid_attributes)
  #     get :edit, id: topic
  #     expect(response).to render_template('edit')
  #   end

  #   it 'assigns @topic' do
  #     topic = Topic.create!(valid_attributes)
  #     get :edit, id: topic
  #     expect(assigns(:topic)).to eq topic
  #   end
  # end

  # describe 'PATCH update' do
  #   context 'with valid attributes' do
  #     let(:new_attributes) {
  #       { name: 'Another Stupid Trick',  'Much disbelief. Wow.' }
  #     }

  #     it 'updates the requested topic' do
  #       topic = Topic.create!(valid_attributes)
  #       patch :update, id: topic, topic: new_attributes
  #       topic.reload
  #       expect(topic.name).to eq new_attributes[:name]
  #     end

  #     it 'assigns @topic' do
  #       topic = Topic.create!(valid_attributes)
  #       patch :update, id: topic, topic: new_attributes
  #       expect(assigns(:topic)).to eq topic
  #     end

  #     it 'redirects to the topic' do
  #       topic = Topic.create!(valid_attributes)
  #       patch :update, id: topic, topic: new_attributes
  #       expect(response).to redirect_to topic
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'assigns @topic' do
  #       topic = Topic.create!(valid_attributes)
  #       patch :update, id: topic, topic: invalid_attributes
  #       expect(assigns(:topic)).to eq topic
  #     end

  #     it 're-renders the edit template' do
  #       topic = Topic.create!(valid_attributes)
  #       patch :update, id: topic, topic: invalid_attributes
  #       expect(response).to render_template('edit')
  #     end
  #   end
  # end

  # describe 'DELETE destroy' do
  #   it 'destroys the requested topic' do
  #     topic = Topic.create!(valid_attributes)
  #     expect {
  #       delete :destroy, id: topic
  #     }.to change(Topic, :count).by(-1)
  #   end

  #   it 'redirects to the topics list' do
  #     topic = Topic.create!(valid_attributes)
  #     delete :destroy, id: topic
  #     expect(response).to redirect_to articles_url
  #   end
  # end
end

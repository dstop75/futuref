require 'rails_helper'

RSpec.describe CommentsController do
  let(:topic) { Topic.create!(name: "topic name") }
  let(:resource) { Resource.create!(name: "resource name", url: "http://www.google.com", topic: topic) }
  let(:valid_attributes) {
    { message: "Here's a message", resource_id: resource.id }
  }

  let(:invalid_attributes) {
    { message: nil, resource_id: nil }
  }

  # describe 'GET new' do
  #   it 'has a 200 status code' do
  #     get :new, resource_id: resource.id
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the new template' do
  #     get :new, resource_id: resource.id
  #     expect(response).to render_template('new')
  #   end

  #   it 'assigns @comment' do
  #     get :new, resource_id: resource.id
  #     expect(assigns(:comment)).to be_a_new Comment
  #   end
  # end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new comment' do
        expect {
          post :create, resource_id: resource.id, comment: valid_attributes
        }.to change(Comment, :count).by 1
      end

      it 'assigns @comment' do
        post :create, resource_id: resource.id, comment: valid_attributes
        expect(assigns(:comment)).to be_a Comment
        expect(assigns(:comment)).to be_persisted
      end

      it 'redirects to the parent resource' do
        post :create, resource_id: resource.id, comment: valid_attributes
        expect(response).to redirect_to(resource.topic)
      end
    end

    context 'with invalid attributes' do
      it 'assigns @resource but does not save a new resource' do
        post :create, resource_id: resource.id, comment: invalid_attributes
        expect(assigns(:comment)).to be_a_new Comment
        expect(assigns(:comment)).not_to be_persisted
      end

# a test here for a 'failure to create' message would be good.
    end
  end

  describe 'GET edit' do
    it 'has a 200 status code' do
      comment = Comment.create!(valid_attributes)
      get :edit, id: comment
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      comment = Comment.create!(valid_attributes)
      get :edit, id: comment
      expect(response).to render_template('edit')
    end

    it 'assigns @comment' do
      comment = Comment.create!(valid_attributes)
      get :edit, id: comment
      expect(assigns(:comment)).to eq comment
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_attributes) { { message: 'a new message' } }

      it 'updates the requested comment' do
        comment = Comment.create!(valid_attributes)
        patch :update, id: comment, comment: new_attributes
        comment.reload
        expect(comment.message).to eq new_attributes[:message]
      end

      it 'assigns @comment' do
        comment = Comment.create!(valid_attributes)
        patch :update, id: comment, comment: new_attributes
        expect(assigns(:comment)).to eq comment
      end

      it 'redirects to the parent topic' do
        comment = Comment.create!(valid_attributes)
        patch :update, id: comment, comment: new_attributes
        expect(response).to redirect_to comment.resource.topic
      end
    end

    context 'with invalid_attributes' do
      it 'assigns @comment' do
        comment = Comment.create!(valid_attributes)
        patch :update, id: comment, comment: invalid_attributes
        expect(assigns(:comment)).to eq comment
      end
# a test here for a 'failure to update' message would be good.
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested comment' do
      comment = Comment.create!(valid_attributes)
      expect {
        delete :destroy, id: comment
      }. to change(Comment, :count).by(-1)
    end

    it 'redirects to the parent topic' do
      comment = Comment.create!(valid_attributes)
      topic = comment.resource.topic
      delete :destroy, id: comment
      expect(response).to redirect_to topic
    end
  end
end

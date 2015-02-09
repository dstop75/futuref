require 'rails_helper'

RSpec.feature 'Managing comments' do
  scenario 'List all comments' do
    topic = Topic.create!(name: 'Heroku')
    resource = Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)
    Comment.create!(message: 'This resource is too advanced', resource: resource)
    Comment.create!(message: 'This resource is too basic', resource: resource)
    Comment.create!(message: 'This resource is just right', resource: resource)

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'This resource is too advanced'
    expect(page).to have_content 'This resource is too basic'
    expect(page).to have_content 'This resource is just right'
    # h3 selector used for testing purposes
    expect(page).to have_selector 'h3', count: 3
  end

  # scenario 'Create a comment' do
  #   topic = Topic.create!(name: 'Heroku')
  #   resource = Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)
  #   visit "/resources/#{resource.id}/comments/new"

  #   fill_in 'Message', with: 'This resource is tremendous'
  #   click_on 'Create Resource'

  #   expect(page).to have_content(/success/i)
  # end

  # scenario 'Read a comment' do
  #   topic = Topic.create!(name: 'Heroku')
  #   Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)
  #   Comment.create!(message: 'This resource is amazing', resource: resource)

  #   visit "/topics/#{topic.id}"

  #   expect(page).to have_content 'This resource is amazing'
  # end

  # scenario 'Update a comment' do
  #   topic = Topic.create!(name: 'Heroku')
  #   resource = Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)
  #   comment = resource.comments.create!(message: 'This resource is fantastic', resource: resource)

  #   visit "/comments/#{comment.id}/edit"

  #   fill_in 'Message', with: 'This resource is incredible'
  #   click_on 'Update Resource'

  #   expect(page).to have_content(/success/i)
  #   expect(page).to have_content 'This resource is incredible'
  # end

  # scenario 'Delete a comment' do
  #   topic = Topic.create!(name: 'Heroku')
  #   resource = Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)
  #   comment = resource.comments.create!(message: 'This resource is fantastic', resource: resource)

  #   visit "/topics/#{topic.id}"

  #   click_on 'Delete comment'

  #   expect(page).to have_content(/success/i)
  # end
end

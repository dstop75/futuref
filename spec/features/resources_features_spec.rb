require 'rails_helper'

RSpec.feature 'Managing resources' do
  scenario 'List all resources' do
    topic = Topic.create!(name: 'Heroku')
    Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)
    Resource.create!(name: 'Getting started with Rails', url: 'https://devcenter.heroku.com/articles/getting-started-with-rails4', topic: topic)
    Resource.create!(name: 'Heroku Wikipedia', url: 'http://en.wikipedia.org/wiki/Heroku', topic: topic)

    visit "/topics/#{topic.id}"

    expect(page).to have_content "Heroku-related Resources"
    expect(page).to have_selector 'div', count: 3
  end

  scenario 'Create a resource' do
    topic = Topic.create!(name: 'Heroku')
    visit "/topics/#{topic.id}/resources/new"

    fill_in 'Name', with: 'Deploying to Heroku'
    fill_in 'Url', with: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku'
    click_on 'Create Resource'

    expect(page).to have_content(/success/i)
  end

  scenario 'Read a resource' do
    topic = Topic.create!(name: 'Heroku')
    Resource.create!(name: 'Deploying to Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku', topic: topic)

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'Deploying to Heroku'
  end

  # scenario 'Update a resource' do
  #   topic = Topic.create!(name: 'Conventions')
  #   resource = topic.resources.create!(name: 'Naming Conventions')

  #   visit "/resources/#{resource.id}/edit"

  #   fill_in 'Name', with: 'Routing Conventions'
  #   click_on 'Update Resource'

  #   expect(page).to have_content(/success/i)
  #   expect(page).to have_content 'Routing Conventions'
  # end

  # scenario 'Delete a resource' do
  #   topic = Topic.create!(name: 'Conventions')
  #   resource = topic.resources.create!(name: 'Naming Conventions')

  #   visit '/resources/#{resource.id}/edit'

  #   click_on 'Delete Resource'

  #   expect(page).to have_content(/success/i)
  # end
end

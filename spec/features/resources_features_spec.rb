require 'rails_helper'

RSpec.feature 'Managing resources' do
  scenario 'List all resources' do
    topic = Topic.create!(name: 'Conventions')
    Resource.create!(name: 'Deploying to Heroku', topic: topic)
    Resource.create!(name: 'Getting started with Rails', topic: topic)
    Resource.create!(name: 'Bootstrap tutorial', topic: topic)

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'Resources'
    expect(page).to have_selector 'p', count: 3
  end

  # scenario 'Create a resource' do
  #   topic = Topic.create!(name: 'Conventions')
  #   visit "/topics/#{topic.id}/resources/new"

  #   fill_in 'Name', with: 'Data Modeling 101'
  #   click_on 'Create Resource'

  #   expect(page).to have_content(/success/i)
  # end

  # scenario 'Read a resource' do
  #   topic = Topic.create!(name: 'Conventions')
  #   resource = topic.resources.create!(name: 'Naming Conventions')

  #   visit "/resources/#{resource.id}"

  #   expect(page).to have_content 'Naming Conventions'
  # end

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

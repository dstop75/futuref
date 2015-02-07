require 'rails_helper'

RSpec.feature 'Managing topics' do
  scenario 'List all topics' do
    Topic.create!(name: 'REST')
    Topic.create!(name: 'RSpec')
    Topic.create!(name: 'Relational Databases')

    visit '/topics'

    expect(page).to have_content 'Topics'
    expect(page).to have_selector 'p', count: 3
  end

  scenario 'Create a topic' do
    visit '/topics/new'

    fill_in 'Name', with: 'Rails'
    click_on 'Create Topic'

    expect('/topics').to have_content(/success/i)
  end

  # scenario 'Read a topic' do
  #   topic = Topic.create!(name: 'REST')

  #   visit "/topics/#{topic.id}"

  #   expect(page.find('h1')).to have_content 'REST'
  #   expect(page).to have_content # a list of resources, maybe a list of comments
  # end

  # scenario 'Update a topic' do
  #   topic = Topic.create!(name: 'REST')

  #   visit "topics/#{topic.id}/edit"

  #   fill_in 'Name', with: 'Conventions'
  #   click_on 'Update Topic'

  #   expect(page).to have_content(/success/i)
  #   expect(page.find('h1')).to have_content 'A Different Trick'
  #   expect(page).to have_content 'Much disbelief. Wow.'
  # end

  # scenario 'Delete a topic' do
  #   topic = Topic.create!(name: 'REST')

  #   visit "topics/#{topic.id}/edit"

  #   click_on 'Delete Topic'

  #   expect(page).to have_content(/success/i)
  # end
end

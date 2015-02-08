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

    expect(page).to have_content(/success/i)
  end

  scenario 'Read a topic' do
    topic = Topic.create!(name: 'REST')

    visit "/topics/#{topic.id}"

    expect(page).to have_content 'REST'
  end

  scenario 'Update a topic' do
    topic = Topic.create!(name: 'REST')

    visit "topics/#{topic.id}/edit"

    fill_in 'Name', with: 'Conventions'
    click_on 'Update Topic'

    expect(page).to have_content(/success/i)
    expect(page).to have_content 'Conventions'
  end

  scenario 'Delete a topic' do
    topic = Topic.create!(name: 'REST')

    visit "topics"

    click_on 'Delete'

    expect(page).to have_content(/success/i)
  end
end

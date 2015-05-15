require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('add venue form path', :type => :feature) do
  it('will allow a user to add a venue which will be returned on the index page') do
    visit('/venues/new')
    fill_in('name', :with => 'The Fox')
    click_button('Add Venue')
    expect(page).to have_content('The Fox')
  end
end

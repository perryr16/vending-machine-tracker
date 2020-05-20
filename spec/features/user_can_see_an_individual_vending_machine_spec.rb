require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end


end

#
# User Story 1 of 3
#
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
# ```

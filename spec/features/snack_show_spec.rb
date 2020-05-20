require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
    scenario 'there is a snack list' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      jims  = owner.machines.create(location: "Milos")
      dougs  = owner.machines.create(location: "Pats Pizza")

      cheetos = Snack.create(name: "Cheetos", price: "$1.50")
      ding_dongs = Snack.create(name: "Ding Dongs", price: "$2.50")
      starburst = Snack.create(name: "Starburst", price: "$1.00")
      cigs = Snack.create(name: "Camel Cigarettes", price: "$9.50")

      MachineSnack.create(machine_id: dons.id, snack_id: cheetos.id)
      MachineSnack.create(machine_id: dons.id, snack_id: ding_dongs.id)
      MachineSnack.create(machine_id: dons.id, snack_id: starburst.id)
      MachineSnack.create(machine_id: dons.id, snack_id: cigs.id)
      MachineSnack.create(machine_id: jims.id, snack_id: ding_dongs.id)
      MachineSnack.create(machine_id: jims.id, snack_id: starburst.id)
      MachineSnack.create(machine_id: jims.id, snack_id: cigs.id)
      MachineSnack.create(machine_id: dougs.id, snack_id: starburst.id)
      MachineSnack.create(machine_id: dougs.id, snack_id: cigs.id)

      visit "/snacks/#{cheetos.id}"

      within("#snack-#{cheetos.id}")do
        expect(page).to have_content(cheetos.name)
        expect(page).to have_content("Price: #{cheetos.price}")
        expect(page).to have_content("Locations")
        expect(page).to have_content("#{dons.location} (#{dons.snacks.count} kinds of snacks, average price of #{dons.average_price})")
      end

      visit "/snacks/#{cigs.id}"

      within("#snack-#{cigs.id}")do
        expect(page).to have_content(cigs.name)
        expect(page).to have_content("Price: #{cigs.price}")
        expect(page).to have_content("Locations")
        expect(page).to have_content("#{dons.location} (#{dons.snacks.count} kinds of snacks, average price of #{dons.average_price})")
        expect(page).to have_content("#{jims.location} (#{jims.snacks.count} kinds of snacks, average price of #{jims.average_price})")
        expect(page).to have_content("#{dougs.location} (#{dougs.snacks.count} kinds of snacks, average price of #{dougs.average_price})")
      end
    end
  end

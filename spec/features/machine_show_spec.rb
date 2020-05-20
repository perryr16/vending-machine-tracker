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



    visit machine_path(dons)

    within(".snacks")do
      expect(page).to have_content("#{cheetos.name}: #{cheetos.price}")
      expect(page).to have_content("#{ding_dongs.name}: #{ding_dongs.price}")
      expect(page).to have_content("#{starburst.name}: #{starburst.price}")
      expect(page).to have_content("#{cigs.name}: #{cigs.price}")
    end
  end

  scenario 'there is an average snack price' do
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
    
    visit machine_path(dons)

    within(".snacks")do
      expect(page).to have_content("Average Price: #{dons.average_price}")
    end
  end


end

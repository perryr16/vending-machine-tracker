require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many :machine_snacks}
    it { should have_many(:snacks).through(:machine_snacks)}
  end

  it "returns avearge price of snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    cheetos = dons.snacks.create(name: "Cheetos", price: "$1.50")
    ding_dongs = dons.snacks.create(name: "Ding Dongs", price: "$2.50")
    starburst = dons.snacks.create(name: "Starburst", price: "$1.00")
    cigs = dons.snacks.create(name: "Camel Cigarettes", price: "$9.00")

    expect(dons.average_price).to eq("$3.5")

  end


end

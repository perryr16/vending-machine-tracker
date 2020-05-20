class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner

  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_price
    prices = snacks.pluck(:price)
    prices = prices.map{|price| price.sub("$","").to_f}
    avg_price = prices.sum / prices.length.to_f.round(2)
    result = "$"+avg_price.to_s

  end

end

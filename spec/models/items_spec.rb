require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'should save attributes' do
    merchant = Merchant.create!(name: "Tron Kat")
    item = merchant.items.create!(name: "Rando Item", description: "Rando Description", unit_price: 20)
    expect(item.name).to eq('Rando Item')
    expect(item.description).to eq('Rando Description')
    expect(item.unit_price).to eq(20)
    expect(item.merchant.name).to eq('Tron Kat')
  end

  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
  end

  describe 'validation' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
  end
end

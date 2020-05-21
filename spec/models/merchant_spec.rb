require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'should save attributes' do
    merchant = Merchant.create!(name: "Tron Kat")
    expect(merchant.name).to eq('Tron Kat')
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:customers).through(:invoices)}
  end

  describe 'validation' do
    it { should validate_presence_of :name }
  end
end

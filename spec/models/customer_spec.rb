require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'should save attributes' do
    customer = Customer.create!(first_name: "Tron", last_name: "Kat")
    expect(customer.first_name).to eq('Tron')
    expect(customer.last_name).to eq('Kat')
  end

  describe 'validation' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe 'relationships' do
    it {should have_many :invoices}
    it {should have_many(:merchants).through(:invoices)}
  end
end

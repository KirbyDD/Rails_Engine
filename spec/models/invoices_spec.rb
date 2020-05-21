require "rails_helper"

RSpec.describe Invoice, type: :model do
  it 'attributes' do
    merchant = Merchant.create!(name: "Dougie")
    customer = Customer.create!(first_name: "Tron", last_name: "Kat")
    invoice = Invoice.create!(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    expect(invoice.customer.first_name).to eq('Tron')
    expect(invoice.merchant.name).to eq('Dougie')
    expect(invoice.status).to eq('shipped')
  end

  describe 'validations' do
    it { should validate_presence_of :status }
  end

  describe 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many :transactions }
  end
end

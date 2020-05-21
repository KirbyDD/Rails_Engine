require "rails_helper"

RSpec.describe InvoiceItem, type: :model do
  it 'attributes' do
    merchant = Merchant.create!(name: "Dougie")
    customer = Customer.create!(first_name: "Tron", last_name: "Kat")
    item = merchant.items.create!(name: "Rando Item", description: "Rando Description", unit_price: 20)
    invoice = Invoice.create!(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice_item = InvoiceItem.create!(item_id: item.id, invoice_id: invoice.id, quantity: 5, unit_price: item.unit_price)

    expect(invoice_item.item.name).to eq('Rando Item')
    expect(invoice_item.quantity).to eq(5)
    expect(invoice_item.unit_price).to eq(20)
  end

  describe 'validations' do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
  end

  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item}
  end
end

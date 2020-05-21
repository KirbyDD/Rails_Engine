require "rails_helper"

RSpec.describe Transaction, type: :model do
  it 'attributes' do
    merchant = Merchant.create!(name: "Dougie")
    customer = Customer.create!(first_name: "Tron", last_name: "Kat")
    invoice = Invoice.create!(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    transaction = Transaction.create!(invoice_id: invoice.id, credit_card_number: "1111111122222222", credit_card_expiration_date: "01/26/2021", result: "success")

    expect(transaction.invoice.id).to eq(invoice.id)
    expect(transaction.credit_card_number).to eq("1111111122222222")
    expect(transaction.credit_card_expiration_date).to eq("01/26/2021")
    expect(transaction.result).to eq("success")
  end

  describe 'relationships' do
    it { should belong_to :invoice }
  end
end

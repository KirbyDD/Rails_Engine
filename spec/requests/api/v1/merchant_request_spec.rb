require 'rails_helper'

describe "Merchant Endpoint" do
  it "return all merchants" do
    create_list(:merchant, 4)

    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(4)
  end

  it "can find a merchant by id" do
    id = create(:merchant).id.to_s

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(id)
  end

  it "can create merchant" do
    merchant_params = {name: "Tron Kat"}

    post "/api/v1/merchants/", params: {merchant: merchant_params}
    merchant = Merchant.last

    expect(response).to be_successful
    expect(merchant.name).to eq("Tron Kat")
  end

  it "can update merchant" do
    id = create(:merchant).id.to_s
    previous_name = Merchant.last.name
    merchant_params = {name: "Tron Kat"}

    patch "/api/v1/merchants/#{id}", params: {merchant: merchant_params}
    merchant = Merchant.find(id)

    expect(response).to be_successful
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Tron Kat")
  end

  it "can delete merchant" do
    merchant = create(:merchant)
    expect(Merchant.count).to eq(1)

    delete "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful
    expect(Merchant.count).to eq(0)
  end

  it "can get item's merchant" do
    merchant = create(:merchant)
    create(:item, merchant: merchant)
    create(:item, merchant: merchant)
    create(:item, merchant: merchant)
    create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(4)
  end
end

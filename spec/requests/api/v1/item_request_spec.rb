require 'rails_helper'

describe "Item Endpoint" do
  it "return all items" do
    merchant = create(:merchant)
    create(:item, merchant: merchant)
    create(:item, merchant: merchant)
    create(:item, merchant: merchant)
    create(:item, merchant: merchant)

    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(4)
  end

  it "can find a item by id" do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id.to_s

    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"]).to eq(id)
  end

  it "can create item" do
    merchant = create(:merchant)
    item_params = {name: "Football", description: "A ball for football", unit_price: 1000, merchant_id: merchant.id}

    post "/api/v1/items/", params: {item: item_params}
    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq("Football")
  end

  it "can update item" do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id.to_s
    previous_name = Item.last.name
    item_params = {name: "Tron Kat"}

    patch "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find(id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Tron Kat")
  end

  it "can delete item" do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id.to_s
    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
  end

  it "can get item's merchant" do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id.to_s
    expect(Item.count).to eq(1)

    get "/api/v1/items/#{id}/merchant"
    response_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response_merchant["data"]["id"]).to eq(merchant.id.to_s)
  end
end

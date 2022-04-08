require 'rails_helper'

RSpec.describe "Cryptos", type: :request do
  describe "GET /index" do
   it "gets a list of cryptos" do
    Crypto.create(
      name: "Bitcoin",
      age: 13,
      creator: "Satoshi Nakamoto",
      image: "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    )
    get '/cryptos'

    crypto = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(crypto.length).to eq 1
   end 
  end
  
  describe "POST /create" do
    it "creates a crypto" do
     crypto_params = {
       crypto: {
          name: "Angular",
          age: 14,
          creator: "Satoshi Nakamotoo",
          image: "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
       }
     }
    post '/cryptos', params: crypto_params
    expect(response).to have_http_status(200)
    crypto = Crypto.first
    expect(crypto.name).to eq 'Angular'
    end 
   end

   describe "PATCH /update" do
    it "updates a crypto" do
      old_crypto = Crypto.create(
          name: "Angular",
          age: 14,
          creator: "Satoshi Nakamotoo",
          image: "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      )
      crypto_params = {
       crypto: {
          name: "Angular",
          age: 14,
          creator: "TSatoshi Nakamotooo",
          image: "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
       }
     }
     patch "/cryptos/#{old_crypto.id}", params: crypto_params
     crypto = Crypto.find(old_crypto.id)
     expect(response).to have_http_status(200)
     expect(crypto.creator).to eq 'TSatoshi Nakamotooo'
    end 
  end 

  describe "DELETE /destroy" do
    it "deletes a crypto from the database" do
      old_crypto = Crypto.create(
        name: "Angular",
          age: 14,
          creator: "Satoshi Nakamotoo",
          image: "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      )
     delete "/cryptos/#{old_crypto.id}"
     expect(response).to have_http_status(200)
     cryptos = Crypto.all
     expect(cryptos).to be_empty
    end 
   end
end

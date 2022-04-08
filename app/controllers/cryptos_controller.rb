class CryptosController < ApplicationController
    def index
        cryptos = Crypto.all
        render json: cryptos
    end
  
    def create
        crypto = Crypto.create(crypto_params)
        render json: crypto
    end

    def update
        crypto = Crypto.find(params[:id])
        crypto.update(crypto_params)
        if crypto.valid?
            render json: crypto 
        else
            render json: crypto.errors
        end 
    end
  
    def destroy
        crypto = Crypto.find(params[:id])
        if crypto.destroy
            render json: crypto
        else
            render json: crypto.errors
        end 
    end

    private 
    def crypto_params
        params.require(:crypto).permit(:name, :age, :creator, :image)
    end 
  end
  



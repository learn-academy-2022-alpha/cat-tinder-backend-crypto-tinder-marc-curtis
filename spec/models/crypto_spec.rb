require 'rails_helper'

RSpec.describe Crypto, type: :model do
  it 'should validate name' do
    crypto = Crypto.create(
      age: 13,
      creator: 'Satoshi',
      image: 'https://s.yimg.com/ny/api/res/1.2/i9A8JEqoYGBN_I93flEYHg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2022-01/79941670-6e50-11ec-bfeb-d6933833b40d'
    )
      expect(crypto.errors[:name]).to_not be_empty
  end
  it 'should validate age' do
    crypto = Crypto.create(
      name: 'Bitcoin',
      creator: 'Satoshi',
      image: 'https://s.yimg.com/ny/api/res/1.2/i9A8JEqoYGBN_I93flEYHg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2022-01/79941670-6e50-11ec-bfeb-d6933833b40d'
    )
      expect(crypto.errors[:age]).to_not be_empty
  end
  it 'should validate creator' do
    crypto = Crypto.create(
      name: 'Bitcoin',
      age: 13,
      image: 'https://s.yimg.com/ny/api/res/1.2/i9A8JEqoYGBN_I93flEYHg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MDtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2022-01/79941670-6e50-11ec-bfeb-d6933833b40d'
    )
      expect(crypto.errors[:creator]).to_not be_empty
  end
  it 'should validate creator' do
    crypto = Crypto.create(
      name: 'Bitcoin',
      age: 13,
      creator: 'Satoshi'
    )
      expect(crypto.errors[:image]).to_not be_empty
  end
end

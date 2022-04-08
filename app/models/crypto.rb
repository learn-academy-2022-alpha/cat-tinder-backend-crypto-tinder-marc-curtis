class Crypto < ApplicationRecord
    validates :name, :age, :creator, :image, presence: true
end

class CreateCryptos < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.integer :age
      t.string :creator
      t.text :image

      t.timestamps
    end
  end
end

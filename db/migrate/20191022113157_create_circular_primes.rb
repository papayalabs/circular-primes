class CreateCircularPrimes < ActiveRecord::Migration[5.2]
  def change
    create_table :circular_primes do |t|
      t.string :number
      t.string :primes

      t.timestamps
    end
  end
end

class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :rental_id
      t.string :title
      t.string :owner
      t.string :city
      t.string :location
      t.string :category
      t.string :bedrooms
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end

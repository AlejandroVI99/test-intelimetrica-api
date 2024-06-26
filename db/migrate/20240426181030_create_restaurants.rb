class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.integer :rating
      t.text :name
      t.text :site
      t.text :email
      t.text :phone
      t.text :street
      t.text :city
      t.text :state
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end

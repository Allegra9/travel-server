class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :country
      t.string :location
      t.string :things_did
      t.string :notes
      t.datetime :date_from
      t.datetime :date_to
      t.string :image_data
      t.string :image_name
      t.string :image_type
      t.string :image_size
      t.integer :user_id

      t.timestamps
    end
  end
end

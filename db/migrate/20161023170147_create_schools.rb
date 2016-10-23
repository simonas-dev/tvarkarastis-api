class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
    	t.string :name
    	t.integer :code
    	t.string :address
    	t.string :web
    	t.string :g_place_id
    	t.string :g_lat_lng
      t.timestamps
    end
  end
end

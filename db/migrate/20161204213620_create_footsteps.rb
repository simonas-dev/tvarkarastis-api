class CreateFootsteps < ActiveRecord::Migration[5.0]
  def change
    create_table :footsteps do |t|
    	t.belongs_to :user, index: true
    	t.string :g_lat_lng
    	t.timestamps
    end
  end
end

class AddFieldsToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :school_type, :string
    add_column :schools, :contacts, :string
    add_column :schools, :is_hidden, :boolean
  end
end

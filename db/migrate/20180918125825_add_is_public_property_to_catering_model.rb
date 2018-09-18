class AddIsPublicPropertyToCateringModel < ActiveRecord::Migration[5.2]
  def change
    add_column :caterings, :is_publicly_listed,
               :boolean, null: false, default: true
  end
end

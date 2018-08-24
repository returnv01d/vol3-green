class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.timestamps
    end
    # add_index :meals, #:id_catering
  end
end

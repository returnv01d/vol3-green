class JoinMealsToCaterings < ActiveRecord::Migration[5.2]
  def change
    change_table :meals do |t|
      t.belongs_to :catering, index: true
    end
  end
end

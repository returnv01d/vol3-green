class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :catering, index: true
      t.belongs_to :user, index: true
    end
  end
end

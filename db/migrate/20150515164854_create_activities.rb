class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.integer :per_use
      t.integer :ounces
      t.boolean :high_efficiency

      t.timestamps null: false
    end
  end
end

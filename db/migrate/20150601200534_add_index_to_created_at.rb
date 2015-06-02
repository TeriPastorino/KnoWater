class AddIndexToCreatedAt < ActiveRecord::Migration
  def change
    add_column :created_at, :add_index, :string
    add_column :created_at, :activities
  end
end

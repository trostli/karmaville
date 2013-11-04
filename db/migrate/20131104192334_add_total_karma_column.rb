class AddTotalKarmaColumn < ActiveRecord::Migration
  def up
    add_column :users, :total_karma, :integer
  end

  def down
    remove_column :users, :total_karma, :integer
  end
end

class AddVotesColumnsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :votes_up, :integer, default: 0
    add_column :posts, :votes_down, :integer, default: 0
  end
end

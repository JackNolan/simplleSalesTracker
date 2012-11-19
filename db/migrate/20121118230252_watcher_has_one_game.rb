class WatcherHasOneGame < ActiveRecord::Migration
  def change
    add_column :watchers, :game_id, :integer   
  end
end

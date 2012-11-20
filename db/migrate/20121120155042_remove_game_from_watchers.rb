class RemoveGameFromWatchers < ActiveRecord::Migration
 def change
  remove_column :watchers, :game
 end
end

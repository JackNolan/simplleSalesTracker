class CreateWatchers < ActiveRecord::Migration
  def change
    create_table :watchers do |t|
      t.string :email
      t.integer :game
      t.decimal :price

      t.timestamps
    end
  end
end

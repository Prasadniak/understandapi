class DropSentimentsTable < ActiveRecord::Migration
  def up
    drop_table :sentiments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

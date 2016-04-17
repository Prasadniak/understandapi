class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :content
      t.timestamps
    end
  end
end

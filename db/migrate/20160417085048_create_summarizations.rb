class CreateSummarizations < ActiveRecord::Migration
  def change
    create_table :summarizations do |t|
      t.string :content
      t.timestamps
    end
  end
end

class Createfourfuncs < ActiveRecord::Migration
  def change
    create_table :fourfuncs do |t|
      t.string :content
      t.timestamps
    end
  end
end

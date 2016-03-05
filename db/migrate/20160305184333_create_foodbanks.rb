class CreateFoodbanks < ActiveRecord::Migration
  def change
    create_table :foodbanks do |t|
      t.string :info_key
      t.text :info
      t.timestamps null: false
    end
  end
end

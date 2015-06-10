class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :activity_id
      t.string :name
      t.string :description
      t.integer :necessity_rating
      t.string :url

      t.timestamps null: false
    end
  end
end

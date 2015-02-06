class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :url
      t.belongs_to :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :resources, :topics
  end
end

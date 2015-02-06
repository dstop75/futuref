class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.belongs_to :resource, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :resources
  end
end

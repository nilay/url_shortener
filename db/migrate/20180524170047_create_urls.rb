# create urls table
class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :slug, index: { unique: true }
      t.text :url, index: { unique: true }, null: false
      t.timestamps
    end
  end
end

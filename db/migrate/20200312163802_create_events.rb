class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :seats
      t.string :location
      t.string 'speakers', array: true
      t.string 'tags', array: true
      t.string 'themes', array: true
      t.string 'pictures', array: true
      t.string 'links', array: true
      t.boolean :published, default: false
      t.boolean :free
      t.string :podcast
      t.string :video
      t.json :payload

      t.timestamps
    end
  end
end

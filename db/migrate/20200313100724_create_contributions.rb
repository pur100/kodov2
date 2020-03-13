class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.references :events, null: false, foreign_key: true
      t.references :speakers, null: false, foreign_key: true

      t.timestamps
    end
  end
end

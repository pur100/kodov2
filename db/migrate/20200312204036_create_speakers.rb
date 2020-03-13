class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :speakers do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :avatar
      t.string :specialty
      t.string :establishments
      t.references :events, null: false, foreign_key: true

      t.timestamps
    end
  end
end

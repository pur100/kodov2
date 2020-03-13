class RemoveEventsFromSpeakers < ActiveRecord::Migration[6.0]
  def change
    remove_column :speakers, :events_id
    add_column :speakers, :contributions_id, :integer
  end
end

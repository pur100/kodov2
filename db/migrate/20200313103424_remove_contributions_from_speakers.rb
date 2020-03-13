class RemoveContributionsFromSpeakers < ActiveRecord::Migration[6.0]
  def change
        remove_column :speakers, :contributions_id
  end
end

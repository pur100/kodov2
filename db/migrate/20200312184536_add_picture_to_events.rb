class AddPictureToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :pictures
    add_column :events, :picture, :string
  end
end

class Category < ApplicationRecord
  remove_column :events, :category_id
  add_column :events, :category, :string
end

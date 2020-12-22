class AddImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :file_field
  end
end

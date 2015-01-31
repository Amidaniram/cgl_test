class RemoveImageUrlFromNews < ActiveRecord::Migration
  def change
    remove_column :news, :image_url, :string
  end
end

class AddShortTextToNews < ActiveRecord::Migration
  def change
    add_column :news, :short_text, :string
  end
end

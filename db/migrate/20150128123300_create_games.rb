class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :logo_url

      t.timestamps null: false
    end
  end
end

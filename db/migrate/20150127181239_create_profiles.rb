class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :avatar_url
      t.string :skype
      t.string :country
      t.string :vk

      t.timestamps null: false
    end
  end
end

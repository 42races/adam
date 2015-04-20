class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :username
      t.string :profile_pic
      t.datetime :dob
      t.references :user, index: true

      t.timestamps
    end
    add_index :profiles, :username, unique: true
  end
end

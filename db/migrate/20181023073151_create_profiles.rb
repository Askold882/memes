class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :avatar
      t.string :preferences

      t.timestamps
    end
  end
end

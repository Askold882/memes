class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |t|
      t.string :image
      t.string :description
      t.string :rating
      t.string :'#'

      t.timestamps
    end
  end
end

class CreateTwotts < ActiveRecord::Migration
  def change
    create_table :twotts do |t|
      t.string :giphy_link
      t.string :tweet

      t.timestamps null: false
    end
  end
end

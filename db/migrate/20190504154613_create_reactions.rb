class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.string :stamp_type
      t.integer :stamp_number
      t.timestamps
    end
  end
end

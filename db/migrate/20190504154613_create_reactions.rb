class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.string :stamp_type
      t.references :user, foreign_key: true
      t.references :message  , foreign_key: true
      t.timestamps
    end
  end
end

class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|
      t.text :comm
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

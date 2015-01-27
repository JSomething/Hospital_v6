class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
      t.text :nurse_name
      t.integer :nurseable_id
      t.string :nurseable_type

      t.timestamps null: false
    end
  end
end

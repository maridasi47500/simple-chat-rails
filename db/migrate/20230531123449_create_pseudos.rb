class CreatePseudos < ActiveRecord::Migration[7.0]
  def change
    create_table :pseudos do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

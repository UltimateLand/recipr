class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :dish
      t.text :description

      t.timestamps
    end
  end
end

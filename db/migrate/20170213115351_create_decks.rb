class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string  :name, null: false
      t.boolean :active, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end

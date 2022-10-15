class CreateJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :journals do |t|
      t.integer :team_id,     null: false
      t.text :journal,        null: false

      t.timestamps
    end
  end
end

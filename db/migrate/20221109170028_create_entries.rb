class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :person, foreign_key: true, null: false
      t.references :team, foreign_key: true, null: false

      t.timestamps
    end
  end
end

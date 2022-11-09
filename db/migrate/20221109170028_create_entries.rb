class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :person_id
      t.integer :team_id

      t.timestamps
    end
  end
end

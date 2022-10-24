class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :person_id
      t.integer :team_id

      t.timestamps
    end
  end
end

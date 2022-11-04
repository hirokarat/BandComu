class Bookmark < ApplicationRecord
  
  belongs_to:person
  belongs_to:team
  validates :person_id, uniqueness: { scope: :team_id }
end

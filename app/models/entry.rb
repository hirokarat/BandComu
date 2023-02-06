class Entry < ApplicationRecord
  belongs_to:person
  belongs_to:team
  validates :person_id, uniqueness: { scope: :team_id }
  
  def full_name
    person.full_name
  end
end
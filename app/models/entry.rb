class Entry < ApplicationRecord
  belongs_to:person
  belongs_to:team
  validates :person_id, uniqueness: { scope: :team_id }
  
  def full_name
    self.person.last_name + self.person.first_name
  end
  
end

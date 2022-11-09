class Group::EntriesController < ApplicationController
  
  def index
    @entries = Entry.where(person_id: current_team.id)
  end
  
end

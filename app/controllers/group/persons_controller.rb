class Group::PersonsController < ApplicationController
  def show
  end
  
  def index
    @entries = Entry.where(person_id: current_team.id)
  end
  
  private
  def person_params
    params.require(:person).permit(:last_name)
  end
end

class Group::PersonsController < ApplicationController
  def show
  end
  
  private
  def person_params
    params.require(:person).permit(:last_name)
  end
end

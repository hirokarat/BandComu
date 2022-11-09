class Group::PersonsController < ApplicationController
  def show
  end
  
  def index
   
  end
  
  private
  def person_params
    params.require(:person).permit(:last_name)
  end
end

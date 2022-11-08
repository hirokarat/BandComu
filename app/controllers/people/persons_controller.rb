class People::PersonsController < ApplicationController

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = current_person
  end

  def update
    @person = current_person
    if @person.update(person_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to people_person_path(current_person)
    else
      render :edit
    end
  end
  
  private
  
  def person_params
    params.require(:person).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:telephone_number,:email)
  end

end

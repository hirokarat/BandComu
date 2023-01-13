class Admin::PersonsController < ApplicationController
  before_action :user_shut_out
  before_action :authenticate_admin!
  
  def index
    @persons=Person.page(params[:page]).per(10)
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def destroy
    @person = Person.find(params[:id]) 
    @person.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to action: :index
  end
  
end

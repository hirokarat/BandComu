Rails.application.routes.draw do
  
# 団体用
# URL /teams/sign_in ...
devise_for :teams, skip:[:passwords],controllers: {
  registrations: "group/registrations",
  sessions: 'group/sessions'
}
  
# 顧客用
# URL /persons/sign_in ...
devise_for :people, skip:[:passwords], controllers: {
  registrations: "people/registrations",
  sessions: 'people/sessions'
}
  
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

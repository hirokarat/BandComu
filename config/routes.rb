Rails.application.routes.draw do
  
# 団体用
# URL /teams/sign_in ...
devise_for :teams, skip:[:passwords],controllers: {
  registrations: "group/registrations",
  sessions: 'group/sessions'
}
  devise_scope :team do
    post 'teams/guest_sign_in', to: 'teams/sessions#new_guest'
  end

  
# 顧客用
# URL /persons/sign_in ...
devise_for :people, skip:[:passwords], controllers: {
  registrations: "people/registrations",
  sessions: 'people/sessions'
}
  devise_scope :person do
    post 'people/guest_sign_in', to: 'people/sessions#new_guest'
  end

  
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    root to:'homes#top'
    resources:persons, only: [:index,:show,:destroy,:unsubscribe,:withdraw]
    resources:teams, only:[:index,:show,:destroy,:unsubscribe,:withdraw]
    resources:journals,only: [:index]
  end

namespace :people do
    resources:persons, only: [:show,:edit,:update]
    resources:teams, only: [:index,:show]
    resources:journals, only:[:index]
  end
  
  namespace :group do
    resources:persons, only:[:index,:show]
    resources:teams, only:[:show,:edit,:update]
    resources:journals, only:[:new,:create,:destroy,:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

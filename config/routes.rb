Rails.application.routes.draw do
  root to: "projects#index"
  resources :projects
  post "sort", to: "projects#sort"
  post "create_ticket",to: "projects#create_ticket" 
  post "sort_ticket", to: "projects#sort_ticket"
end

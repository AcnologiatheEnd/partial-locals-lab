Rails.application.routes.draw do
  resources :classrooms
  resources :students
  post '/students/search', to: 'students#search'
end

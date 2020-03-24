Rails.application.routes.draw do
  resources :transactional_functions
  resources :data_functions
  resources :requirements

  root "requirements#index"

  post "import_requirements_file" => 'requirements#import_requirements_file'

end
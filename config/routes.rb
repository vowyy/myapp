Rails.application.routes.draw do

  root 'pages#home'

  devise_for :japaneses, controllers: {registrations: 'japaneses/registrations'}
end

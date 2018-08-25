Rails.application.routes.draw do

  root 'pages#home'
  get '/jhome/', to: 'pages#jhome'


  #　(devise/confirmations#アクション)　＝＞　(japaneses/confirmation#アクション)に変更
  devise_for :japaneses, controllers: {
                                        registrations: 'japaneses/registrations',
                                        confirmations: 'japaneses/confirmations',
                                        sessions:      'japaneses/sessions'
                                       }

  devise_for :foreigners, controllers: {
                                         registrations:      'foreigners/registrations',
                                         omniauth_callbacks: 'foreigners/omniauth_callbacks',
                                         sessions:           'foreigners/sessions'
                                        }

    resources :japaneses,  only: [:show]
    resources :foreigners, only: [:show]
    resources :profiles, except: [:index, :show, :delete]

    resources :meals,shallow: true do
      resources :matches
      resources :favors, only: [:create, :destroy]
      get :serch, on: :collection
    end

    resources :rooms do
      resources :messages , only: [:create, :destroy]
    end
end

# == Route Map
#
#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                                  root GET      /                                                                                        pages#home
#                                 jhome GET      /jhome(.:format)                                                                         pages#jhome
#                  new_japanese_session GET      /japaneses/sign_in(.:format)                                                             japaneses/sessions#new
#                      japanese_session POST     /japaneses/sign_in(.:format)                                                             japaneses/sessions#create
#              destroy_japanese_session DELETE   /japaneses/sign_out(.:format)                                                            japaneses/sessions#destroy
#                 new_japanese_password GET      /japaneses/password/new(.:format)                                                        devise/passwords#new
#                edit_japanese_password GET      /japaneses/password/edit(.:format)                                                       devise/passwords#edit
#                     japanese_password PATCH    /japaneses/password(.:format)                                                            devise/passwords#update
#                                       PUT      /japaneses/password(.:format)                                                            devise/passwords#update
#                                       POST     /japaneses/password(.:format)                                                            devise/passwords#create
#          cancel_japanese_registration GET      /japaneses/cancel(.:format)                                                              japaneses/registrations#cancel
#             new_japanese_registration GET      /japaneses/sign_up(.:format)                                                             japaneses/registrations#new
#            edit_japanese_registration GET      /japaneses/edit(.:format)                                                                japaneses/registrations#edit
#                 japanese_registration PATCH    /japaneses(.:format)                                                                     japaneses/registrations#update
#                                       PUT      /japaneses(.:format)                                                                     japaneses/registrations#update
#                                       DELETE   /japaneses(.:format)                                                                     japaneses/registrations#destroy
#                                       POST     /japaneses(.:format)                                                                     japaneses/registrations#create
#             new_japanese_confirmation GET      /japaneses/confirmation/new(.:format)                                                    japaneses/confirmations#new
#                 japanese_confirmation GET      /japaneses/confirmation(.:format)                                                        japaneses/confirmations#show
#                                       POST     /japaneses/confirmation(.:format)                                                        japaneses/confirmations#create
#                 new_foreigner_session GET      /foreigners/sign_in(.:format)                                                            foreigners/sessions#new
#                     foreigner_session POST     /foreigners/sign_in(.:format)                                                            foreigners/sessions#create
#             destroy_foreigner_session DELETE   /foreigners/sign_out(.:format)                                                           foreigners/sessions#destroy
# foreigner_facebook_omniauth_authorize GET|POST /foreigners/auth/facebook(.:format)                                                      foreigners/omniauth_callbacks#passthru
#  foreigner_facebook_omniauth_callback GET|POST /foreigners/auth/facebook/callback(.:format)                                             foreigners/omniauth_callbacks#facebook
#                new_foreigner_password GET      /foreigners/password/new(.:format)                                                       devise/passwords#new
#               edit_foreigner_password GET      /foreigners/password/edit(.:format)                                                      devise/passwords#edit
#                    foreigner_password PATCH    /foreigners/password(.:format)                                                           devise/passwords#update
#                                       PUT      /foreigners/password(.:format)                                                           devise/passwords#update
#                                       POST     /foreigners/password(.:format)                                                           devise/passwords#create
#         cancel_foreigner_registration GET      /foreigners/cancel(.:format)                                                             foreigners/registrations#cancel
#            new_foreigner_registration GET      /foreigners/sign_up(.:format)                                                            foreigners/registrations#new
#           edit_foreigner_registration GET      /foreigners/edit(.:format)                                                               foreigners/registrations#edit
#                foreigner_registration PATCH    /foreigners(.:format)                                                                    foreigners/registrations#update
#                                       PUT      /foreigners(.:format)                                                                    foreigners/registrations#update
#                                       DELETE   /foreigners(.:format)                                                                    foreigners/registrations#destroy
#                                       POST     /foreigners(.:format)                                                                    foreigners/registrations#create
#                              japanese GET      /japaneses/:id(.:format)                                                                 japaneses#show
#                             foreigner GET      /foreigners/:id(.:format)                                                                foreigners#show
#                              profiles POST     /profiles(.:format)                                                                      profiles#create
#                           new_profile GET      /profiles/new(.:format)                                                                  profiles#new
#                          edit_profile GET      /profiles/:id/edit(.:format)                                                             profiles#edit
#                               profile PATCH    /profiles/:id(.:format)                                                                  profiles#update
#                                       PUT      /profiles/:id(.:format)                                                                  profiles#update
#                                       DELETE   /profiles/:id(.:format)                                                                  profiles#destroy
#                          meal_matches GET      /meals/:meal_id/matches(.:format)                                                        matches#index
#                                       POST     /meals/:meal_id/matches(.:format)                                                        matches#create
#                        new_meal_match GET      /meals/:meal_id/matches/new(.:format)                                                    matches#new
#                            edit_match GET      /matches/:id/edit(.:format)                                                              matches#edit
#                                 match GET      /matches/:id(.:format)                                                                   matches#show
#                                       PATCH    /matches/:id(.:format)                                                                   matches#update
#                                       PUT      /matches/:id(.:format)                                                                   matches#update
#                                       DELETE   /matches/:id(.:format)                                                                   matches#destroy
#                           meal_favors POST     /meals/:meal_id/favors(.:format)                                                         favors#create
#                                 favor DELETE   /favors/:id(.:format)                                                                    favors#destroy
#                           serch_meals GET      /meals/serch(.:format)                                                                   meals#serch
#                                 meals GET      /meals(.:format)                                                                         meals#index
#                                       POST     /meals(.:format)                                                                         meals#create
#                              new_meal GET      /meals/new(.:format)                                                                     meals#new
#                             edit_meal GET      /meals/:id/edit(.:format)                                                                meals#edit
#                                  meal GET      /meals/:id(.:format)                                                                     meals#show
#                                       PATCH    /meals/:id(.:format)                                                                     meals#update
#                                       PUT      /meals/:id(.:format)                                                                     meals#update
#                                       DELETE   /meals/:id(.:format)                                                                     meals#destroy
#                         room_messages POST     /rooms/:room_id/messages(.:format)                                                       messages#create
#                          room_message DELETE   /rooms/:room_id/messages/:id(.:format)                                                   messages#destroy
#                                 rooms GET      /rooms(.:format)                                                                         rooms#index
#                                       POST     /rooms(.:format)                                                                         rooms#create
#                              new_room GET      /rooms/new(.:format)                                                                     rooms#new
#                             edit_room GET      /rooms/:id/edit(.:format)                                                                rooms#edit
#                                  room GET      /rooms/:id(.:format)                                                                     rooms#show
#                                       PATCH    /rooms/:id(.:format)                                                                     rooms#update
#                                       PUT      /rooms/:id(.:format)                                                                     rooms#update
#                                       DELETE   /rooms/:id(.:format)                                                                     rooms#destroy
#                    rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  root 'pages#home'

  #　(devise/confirmations#アクション)　＝＞　(japaneses/confirmation#アクション)に変更
  devise_for :japaneses, controllers: {
                                        registrations: 'japaneses/registrations',
                                        confirmations: 'japaneses/confirmations'
                                       }

  devise_for :foreigners, controllers: {
                                         registrations:      'foreigners/registrations',
                                         omniauth_callbacks: 'foreigners/omniauth_callbacks',
                                         sessions:           'foreigners/sessions'
                                        }

   resources :japaneses,  only: [:show]
   resources :foreigners, only: [:show]
   resources :meals
   resources :matches
end

# == Route Map
#
#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                                  root GET      /                                                                                        pages#home
#                  new_japanese_session GET      /japaneses/sign_in(.:format)                                                             devise/sessions#new
#                      japanese_session POST     /japaneses/sign_in(.:format)                                                             devise/sessions#create
#              destroy_japanese_session DELETE   /japaneses/sign_out(.:format)                                                            devise/sessions#destroy
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
#                                 meals GET      /meals(.:format)                                                                         meals#index
#                                       POST     /meals(.:format)                                                                         meals#create
#                              new_meal GET      /meals/new(.:format)                                                                     meals#new
#                             edit_meal GET      /meals/:id/edit(.:format)                                                                meals#edit
#                                  meal GET      /meals/:id(.:format)                                                                     meals#show
#                                       PATCH    /meals/:id(.:format)                                                                     meals#update
#                                       PUT      /meals/:id(.:format)                                                                     meals#update
#                                       DELETE   /meals/:id(.:format)                                                                     meals#destroy
#                               matches GET      /matches(.:format)                                                                       matches#index
#                                       POST     /matches(.:format)                                                                       matches#create
#                             new_match GET      /matches/new(.:format)                                                                   matches#new
#                            edit_match GET      /matches/:id/edit(.:format)                                                              matches#edit
#                                 match GET      /matches/:id(.:format)                                                                   matches#show
#                                       PATCH    /matches/:id(.:format)                                                                   matches#update
#                                       PUT      /matches/:id(.:format)                                                                   matches#update
#                                       DELETE   /matches/:id(.:format)                                                                   matches#destroy
#                    rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

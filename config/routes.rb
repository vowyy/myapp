Rails.application.routes.draw do

  root 'pages#home'

  #　(devise/confirmations#アクション)　＝＞　(japaneses/confirmation#アクション)
  devise_for :japaneses, controllers:
    {
      registrations: 'japaneses/registrations',
      confirmations: 'japaneses/confirmations'
    }
end

# == Route Map
#
#                       Prefix Verb   URI Pattern                                                                              Controller#Action
#                         root GET    /                                                                                        pages#home
#         new_japanese_session GET    /japaneses/sign_in(.:format)                                                             devise/sessions#new
#             japanese_session POST   /japaneses/sign_in(.:format)                                                             devise/sessions#create
#     destroy_japanese_session DELETE /japaneses/sign_out(.:format)                                                            devise/sessions#destroy
#        new_japanese_password GET    /japaneses/password/new(.:format)                                                        devise/passwords#new
#       edit_japanese_password GET    /japaneses/password/edit(.:format)                                                       devise/passwords#edit
#            japanese_password PATCH  /japaneses/password(.:format)                                                            devise/passwords#update
#                              PUT    /japaneses/password(.:format)                                                            devise/passwords#update
#                              POST   /japaneses/password(.:format)                                                            devise/passwords#create
# cancel_japanese_registration GET    /japaneses/cancel(.:format)                                                              japaneses/registrations#cancel
#    new_japanese_registration GET    /japaneses/sign_up(.:format)                                                             japaneses/registrations#new
#   edit_japanese_registration GET    /japaneses/edit(.:format)                                                                japaneses/registrations#edit
#        japanese_registration PATCH  /japaneses(.:format)                                                                     japaneses/registrations#update
#                              PUT    /japaneses(.:format)                                                                     japaneses/registrations#update
#                              DELETE /japaneses(.:format)                                                                     japaneses/registrations#destroy
#                              POST   /japaneses(.:format)                                                                     japaneses/registrations#create
#    new_japanese_confirmation GET    /japaneses/confirmation/new(.:format)                                                    japaneses/confirmations#new
#        japanese_confirmation GET    /japaneses/confirmation(.:format)                                                        japaneses/confirmations#show
#                              POST   /japaneses/confirmation(.:format)                                                        japaneses/confirmations#create
#           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

# frozen_string_literal: true

class Foreigners::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new
    render layout: 'sign-login'
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    redirect_to root_path(locale: :en)
  end
end

# まずsign out を送る
# application controllerのset_localeが発火。
# まだcurrent_userは取れるので最初の分岐に入る。
# I18n.locale = :en　となる
# foreigner sessionのdef destroyへ
# redirect_to root_path(or root_path(locale: :en)
# /　　　params取れない
# または
# /en　　params取れる

# またapplication controllerのset_localeが発火。
# もうcurrent_foreingerとsessionは取れないので　I18n.locale = params[:locale] || I18n.default_locale　へ

# def destroy内がredirect_to root_pathだと
# =>  home.ja.html.erb　で　I18n.localeは:jaでflashは英語 => なぜflashは英語なのか？　
# A.このflashはredirect_to root_pathへ飛んでI18n.localeが:jaになる前に発火するの。I18n.localeがまだ:enの状態。そのあとの行でredirect_to root_pathへ飛ぶ => "/" home.ja.html.erb

# def destroy内redirect_to root_path(locale: :en)だと
# =>　home.en.html.erb　で　I18n.localeは:enでflashは英語

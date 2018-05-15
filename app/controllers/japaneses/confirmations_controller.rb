# frozen_string_literal: true

class Japaneses::ConfirmationsController < Devise::ConfirmationsController
  # 認証メールのリンクを押すとログインできるようにする。
  def show
    super do |resource|
      sign_in(resource)
    end
  end

  protected

  # メール認証後のリダイレクト先をカスタマイズ
  def after_confirmation_path_for(resource_name, _resource)
    if signed_in?(resource_name)
      edit_japanese_registration_path current_japanese
    else
      new_session_path(resource_name)
    end
  end
end

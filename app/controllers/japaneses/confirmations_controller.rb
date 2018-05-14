# frozen_string_literal: true

class Japaneses::ConfirmationsController < Devise::ConfirmationsController
  
  # 認証メールのリンクを押すとログインできるようにする。
  def show
    super do |resource|
      sign_in(resource)
    end
  end
end

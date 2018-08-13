class JapanesesController < ApplicationController
  def show
    render layout: 'personal_user'
    @japanese = Japanese.find(params[:id])
  end
end

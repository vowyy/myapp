class JapanesesController < ApplicationController
  def show
    render layout: 'personal_japanese'
    @japanese = Japanese.find(params[:id])
  end
end

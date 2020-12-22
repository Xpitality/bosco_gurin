module Api
  module V1
    class ApplicationController < ActionController::Base
      respond_to :json
      protect_from_forgery with: :null_session, prepend: true

    end
  end
end


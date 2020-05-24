class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :current_user

  private 
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end 
    end
end

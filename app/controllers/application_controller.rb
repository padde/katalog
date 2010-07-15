class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not allowed to perform this action."
    redirect_to root_url
  end
end

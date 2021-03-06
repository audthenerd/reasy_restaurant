module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_customer
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      # redirect_to(authenticated_customer_root_path) && return
    elsif current_userrest
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      # redirect_to(authenticated_userrest_root_path) && return
    end
  end
end
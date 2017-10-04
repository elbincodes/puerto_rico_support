class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def current_user
      # User.find_by(id: session[:user_id])
      User.where(id: session[:user_id]).first
      # I think: this gets us the current user that is logged in. this can also be nil
    end

    def current_organizations
      orgs = UserOrganization.where({:user_id => current_user.id, :admin => true}).map {|x| x.organization}
      (orgs.length > 0) ? orgs : false
      # @user_organizations = Organization.all
      # if @user_organizations.length == 0
      #   return false
      # end
      # @user_organizations.select do |user_org|
      #   user_org.user == current_user && user_org.admin == true
      # end
    end


    helper_method :current_user, :current_organizations
    # I think: now we can access the current_user in the view
end

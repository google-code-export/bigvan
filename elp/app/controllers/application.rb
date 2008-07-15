# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '8751540e768080e2fe1842ac6118772e'
  private
  def load_main_menu
    #@main_menus=Menu.find(:all,:conditions=>{:parent_id=>nil},:order=>'level')
    @main_menus=Menu.get_main_menu
  end
  def auth
    unless session[:username]
      flash[:error]="Please log in";
      redirect_to :controller=>'main',:action=>'login'
    end
  end
  def record_action_name
    session[:action_name]=action_name
  end
end

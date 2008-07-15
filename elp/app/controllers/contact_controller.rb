class ContactController < ApplicationController
  layout "main"
  before_filter :load_main_menu,:except=>[:index,:login]
  before_filter :load_side_bar,:except=>[:index,:login]
  before_filter :auth
  before_filter :record_action_name,:except=>[:show]
  helper :main
  generate_posts_list "Contact","contact"
  def show
    @post = Post.find(params[:id])
  end
  def load_side_bar
    #method_name="get_sub_of_#{main_menu[2].to_s}"
    @side_bar_menus=Menu.get_sub_of_contact()
  end
end

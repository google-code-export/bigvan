class DownloadsController < ApplicationController
  before_filter :load_main_menu,:except=>[:index,:login]
  before_filter :load_side_bar,:except=>[:index,:login]
  before_filter :auth,:except=>[:login,:do_login]
  before_filter :record_action_name,:except=>[:show]
  layout 'main'
  @@ftp_path="D:/company/ftp/"
  def introduction
    
  end
  generate_file_list :audio,'Audiofiles'
  generate_file_list :text,'Textfiles'
  generate_file_list :video,'Videofiles'
  private   
  def load_side_bar
    #method_name="get_sub_of_#{main_menu[2].to_s}"
    @side_bar_menus=Menu.get_sub_of_downloads()
  end
end

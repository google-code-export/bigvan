class TrainingController < ApplicationController
  layout "main"
  before_filter :load_main_menu,:except=>[:index,:login]
  before_filter :load_side_bar,:except=>[:index,:login]
  before_filter :auth
  before_filter :record_action_name,:except=>[:show]
  helper :main
  def introduction
    @trainings=Post.find_by_sql("select * from tags as t inner join posts as p on t.post_id=p.id where t.tag_name='training' order by p.updated_at desc limit 0,10")
  end
  def show
    @post = Post.find(params[:id])
  end
  def register
    
  end
  private
  def load_side_bar
    #method_name="get_sub_of_#{main_menu[2].to_s}"
    @side_bar_menus=Menu.get_sub_of_training()
  end
end

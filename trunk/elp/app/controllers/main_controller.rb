require 'rdoc/markup/simple_markup'
require 'rdoc/markup/simple_markup/inline'
require 'rdoc/markup/simple_markup/to_html'
class MainController < ApplicationController
  before_filter :load_main_menu,:except=>[:index,:login]
  before_filter :load_side_bar,:except=>[:index,:login]
  before_filter :auth,:except=>[:login,:do_login]
  before_filter :record_action_name,:except=>[:login,:do_login,:index,:show]
  def logout
    reset_session
    redirect_to :action=>'login'
  end
  def do_login
    reset_session
    username=params[:username]
    password=params[:password]
    if UserProxy.check(username,password)==false
      flash[:error]="The username and password is not right"
      redirect_to :action=>'login'
      return
    end
    account=Account.find_by_user_name(username)
    if(account)
      account.last_login_dt=Time.new
      account.save
    else
      account=Account.create(username)
      account.save if account
    end
    session[:username]=username
    puts session[:username]
    redirect_to :action=>'index'
  end
  
  def index
    redirect_to :action=>"dashboard"
  end
  def dashboard
    @highlights=Post.find_by_sql("select * from tags as t inner join posts as p on t.post_id=p.id where t.tag_name='highlight'  order by p.updated_at desc limit 0,10")
    @news=Post.find_by_sql("select * from tags as t inner join posts as p on t.post_id=p.id where t.tag_name='news' order by p.updated_at desc limit 0,10")
    @events=Post.find_by_sql("select * from tags as t inner join posts as p on t.post_id=p.id where t.tag_name='event' order by p.updated_at desc limit 0,10")
    @blogs=Post.find_by_sql("select * from tags as t inner join posts as p on t.post_id=p.id where t.tag_name='blog' order by p.updated_at desc limit 0,10")
  end
  def show
    @post = Post.find(params[:id])
  end
  generate_posts_list "News","news"
  generate_posts_list "Event","event"
  generate_posts_list "Blog","blog"
  private
  def load_side_bar
    #method_name="get_sub_of_#{main_menu[2].to_s}"
    @side_bar_menus=Menu.get_sub_of_main()
  end
end
module MainHelper
  def rend_dash_board(title,posts)
    ret="<h1>#{title}</h1><ul>"
    posts.each do |post|
      ret<<"<li>"<<link_to(post.title,:action=>:show,:id=>post.id)<<"</li>"
    end
    ret<<"</ul>"
  end
end

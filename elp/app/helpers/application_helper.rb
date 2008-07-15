# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def check_is_admin
     if session[:username]
       return UserProxy.is_admin(session[:username])
     else
       return false
     end
  end
  def plain_text(text,replacement=" ")
    text.gsub(/<[^>]*>/){|html| replacement}
  end
  def summary(text,length=10)
    trc_utf8(plain_text(text),length)
  end
  def trc_utf8(text, length = 10, t_string = "...") 
      l=0 
      char_array=text.unpack("U*") 
      char_array.each_with_index do |c,i| 
        l = l+ (c<127 ? 0.5 : 1) 
        if l>=length 
          return char_array[0..i].pack("U*")+(i<char_array.length-1 ? t_string : "") 
        end 
      end 
     return text 
  end 
end

class Post < ActiveRecord::Base
  has_many :tags
  attr_accessor :tag_text
  after_save :save_tags
  def tag_text
    if id
      tags=Tag.find(:all,:conditions=>["post_id=?",id])
      ret=""
      tags.each do |tag| 
        if ret==""
          ret=tag.tag_name
        else
          ret<<" "<<tag.tag_name
        end
      end
      return ret
    else
      return ""
    end
  end
  private
  def save_tags
    tags_array=@tag_text.split(" ")
    #delete all tags related with this post
    if id
      Tag.delete_all ["post_id=?",id]
      tags_array.each do |tag|
        tagObj=Tag.new(:tag_name=>tag,:post_id=>id)
        tagObj.save
      end
    end
  end
end

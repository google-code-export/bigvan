# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

module ContentList
    def generate_posts_list(title,tag_name)
      code_sniplet=%`
      def #{title.downcase}
        @name="#{title}"
        @posts=Post.find_by_sql("select * from tags as t inner join posts as p on t.post_id=p.id where t.tag_name='#{tag_name}' order by p.updated_at desc")
        respond_to do |format|
          format.html { render :action => "list" }
        end
      end
      `
      class_eval(code_sniplet)
    end
    def generate_file_list(typename,foldername=nil)
      if foldername.nil?
        foldername=typename
      end
      code_sniplet=%`
        def #{typename}
          @foldername="#{foldername}"
          @file_list=[]
          Dir.foreach(@@ftp_path+"#{foldername}") do |x| 
            if(x!="." and x!="..") 
              @file_list<<x
            end
          end
          respond_to do |format|
              format.html { render :action => "list" }
          end
        end
        `
        class_eval(code_sniplet)
  end
end

class UserProxy
  @@userInfo={"admin"=>"Stephan_vance_elp7654123","guest"=>"guest"}
  @@admin=["admin","David_H","li_yang-stephan"]
  def self.check(username,password)
    passexpected=@@userInfo[username]
    if passexpected
      return password==passexpected
    else
      return LdapUser.authenticate(username,password)
    end
  end
  def self.is_admin(username)
    if @@admin.index(username)
      return true
    else
      return false
    end
  end
end
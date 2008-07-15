require 'ldap'

class LdapUser
    def self.authenticate(username,password)
         ldap=LDAP::Conn.new('172.16.0.17',389)
         ldap.bind("CN=#{username},DC=WORKSOFT,DC=COM,DC=CN",password)
         return ldap.bound?
         rescue LDAP::ResultError
             return false
         ensure
             ldap.unbind
     end
end

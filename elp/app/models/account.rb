class Account < ActiveRecord::Base
  def self.create(username)
    return self.new(:user_name=>username,:last_login_dt=>Time.new,:create_dt=>Time.new,:level=>0)
  end
end

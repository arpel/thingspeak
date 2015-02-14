class UserSession < Authlogic::Session::Base
#class UserSession < ActiveRecord::Base
  find_by_login_method :find_by_login_or_email

  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
end

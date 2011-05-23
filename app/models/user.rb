class User < ActiveRecord::Base
  include Clearance::User

  validates :handle, :presence => true, :uniqueness => { :case_sensitive => false }
end

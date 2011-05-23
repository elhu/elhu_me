class User < ActiveRecord::Base
  include Clearance::User
  attr_protected :admin

  validates :handle, :presence => true, :uniqueness => { :case_sensitive => false }
end

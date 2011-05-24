# == Schema Information
# Schema version: 20110524094644
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  encrypted_password :string(128)
#  salt               :string(128)
#  confirmation_token :string(128)
#  remember_token     :string(128)
#  created_at         :datetime
#  updated_at         :datetime
#  handle             :string(255)
#  admin              :boolean
#

class User < ActiveRecord::Base
  include Clearance::User
  attr_protected :admin

  validates :handle, :presence => true, :uniqueness => { :case_sensitive => false }
end

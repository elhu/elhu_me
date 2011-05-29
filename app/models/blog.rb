# == Schema Information
# Schema version: 20110524094644
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Blog < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :comments, :dependent => :destroy

  validates :title, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :body, :presence => true
  validates :slug, :uniqueness => true, :uniqueness => { :case_sensitive => false }

  slug :title
end

class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :blog
  belongs_to :user

  validates :content, :presence => true, :length => { :minimum => 25 }
end

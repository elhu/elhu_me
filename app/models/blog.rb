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

  validates :title, :presence => true
  validates :body, :presence => true

  slug :title

  def short_body
    if body.length > 500
      body.truncate(500) + "..."
    else
      body
    end
  end
end

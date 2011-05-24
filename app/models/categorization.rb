# == Schema Information
# Schema version: 20110524105527
#
# Table name: categorizations
#
#  id          :integer         not null, primary key
#  blog_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Categorization < ActiveRecord::Base
  belongs_to :blog
  belongs_to :category
end

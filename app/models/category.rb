# == Schema Information
# Schema version: 20110524102545
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

class Category < ActiveRecord::Base
  has_many :categorizations  
  has_many :blogs, :through => :categorizations

  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  slug :name

  def self.categories_with_count
    Category.find_by_sql("SELECT DISTINCT categories.name AS name, categories.slug AS slug, COUNT(categorizations.id) AS count FROM categories LEFT OUTER JOIN categorizations ON categories.id = categorizations.category_id GROUP BY categorizations.category_id ORDER BY categories.name")
  end

  def to_param
    slug
  end
end

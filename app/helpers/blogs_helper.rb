module BlogsHelper
  def last_titles
    blogs = Blog.find().order(:id => "DESC").limit(5)
  end
  
  def last_articles(max)
    Blog.order("created_at DESC").limit(max)
  end

  def categories
    
  end
end

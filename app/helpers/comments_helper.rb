module CommentsHelper
  def comment_url(blog_slug, comment_id, action = nil)
    if (action.nil?)
      "/blogs/#{blog_slug}/comments/#{comment_id}"
    else
      "/blogs/#{blog_slug}/comments/#{comment_id}/#{action}"
    end
  end
end

module ApplicationHelper
  def title
    base_title = "Elhu.me: "
    if @title.nil?
      base_title
    else
      base_title + @title.capitalize
    end
  end

  def markdown(text)
    options = [:fenced_code, :hard_wrap, :autolink, :no_intraemphasis, :filter_html]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    doc.css("code[@class]").each do |code|
      code.replace Albino.colorize(code.text.rstrip, code[:class])
    end
    doc.to_s
  end
end

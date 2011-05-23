class PagesController < ApplicationController
  def home
    @title = "home"
    @header_title = "home"
  end

  def contact
    @title = "contact"
    @header_title = "contact"
  end

  def about
    @title = "about"
    @header_title = "about"
  end

  def portfolio
    @title = "portfolio"
    @header_title = "portfolio"
  end

end

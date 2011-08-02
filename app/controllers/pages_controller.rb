class PagesController < ApplicationController
  def home
    @title = "home"
    @header_title = "home"
    set_meta_tags :title => 'Home',
      :description => 'Home page',
      :keywords => 'Ruby-on-Rails, Rails, Ruby, Elhu, Freelance'
  end

  def contact
    @title = "contact"
    @header_title = "contact"
    set_meta_tags :title => 'Contact',
      :description => 'Contact page',
      :keywords => 'Contact, Ruby-on-Rails, Rails, Ruby, Elhu, Freelance'
  end

  def about
    @title = "about"
    @header_title = "about"
    set_meta_tags :title => 'About',
      :description => 'About page',
      :keywords => 'Ruby-on-Rails, Rails, Ruby, Elhu, Freelance'
  end

  def portfolio
    @title = "portfolio"
    @header_title = "portfolio"
    set_meta_tags :title => 'Portfolio',
      :description => 'Portfolio page',
      :keywords => 'Projects, Portfolio, OpenAuthenticator, Viarezo, Ruby-on-Rails, Rails, Ruby, Elhu, Freelance'
  end

end

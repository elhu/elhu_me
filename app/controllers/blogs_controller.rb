class BlogsController < ApplicationController
  # GET /blogs
  # GET /blogs.xml
  before_filter :admin_user, :except => [:index, :show]

  def index
    @blogs = Blog.all
    @title = "blog"
    @header_title = "blog"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find_by_slug(params[:id])
    @header_title = "blog"
    @title = @blog.title
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @title = "New blog entry"
    @header_title = "blog"
    @blog = Blog.new
    @categories = Category.order("name ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find_by_slug(params[:id])
    @title = "Edit entry #{@blog.title}"
    @header_title = "blog"
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])
    @blog.categories = Category.find(params[:category_ids]) if params[:category_ids]
    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find_by_slug(params[:id])
    @blog.categories = Category.find(params[:category_ids]) if params[:category_ids]

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find_by_slug(params[:id])
    @categorizations = @blog.categorizations
    @categorizations.each do |cat|
      cat.destroy
    end
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
end

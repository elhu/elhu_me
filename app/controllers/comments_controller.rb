class CommentsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  before_filter :admin_user, :only => [:edit, :destroy]

  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.blog_id = Blog.find_by_slug(params[:blog_id]).id

    respond_to do |format|
      if @comment.save
        format.js { render "comments/create" }
        format.html { redirect_to(@comment.blog :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { redirect_to(@comment.blog :notice => "Comment wasn't successfully created.") }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.js { render 'comments/create'}
        format.html { redirect_to(@comment.blog, :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment_id = @comment.id
    @comment.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end

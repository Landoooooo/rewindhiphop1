class PostsController < ApplicationController
	 before_action :find_post, only: [:edit, :update, :show, :delete]
   before_action :only => [:new, :edit] do 
    redirect_to new_user_session_path unless current_user && current_user.admin
   end

  # Index action to render all posts
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.all.order("created_at DESC").limit(4)
  end

  # New action for creating post
  def new
    @post = Post.new
  end

  # Create action saves the post into database
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user
    if @post.save(post_params)
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  # Edit action retrives the post and renders the edit page
  def edit
  end

  # Update action updates the post with the new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to posts_path(@posts)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show
    set_meta_tags title: @post.title,
      site: "Rewindhiphop.com",
      reverse: true,
      description: @post.caption,
      twitter: {
        card: "summary",
        site: "Rewindhiphop",
        title: @post.title,
        description: @post.caption,
        image: @post.image.url(:medium),
      },
      og: {
        title: @post.title,
        description: @post.caption,
        type: 'website',
        image: @post.image.url(:medium)
      }


    @user = current_user
    @post = Post.friendly.find(params[:id])
    @comments = @post.comments

  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :caption, :image)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end

end

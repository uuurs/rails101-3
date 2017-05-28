class PostsController < ApplicationController

  before_action :authenticate_user!, :onlu => [:new, :create, :edit, :update]
  before_action :find_group_and_post, :only => [:edit, :update, :destroy]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to account_posts_path(@group), notice: "Update succsess"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to account_posts_path(@group), alert: "Post has been deleted"
    
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_group_and_post
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

end

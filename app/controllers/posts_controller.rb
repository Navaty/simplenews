class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end


  def create
    @post = current_user.posts.new(post_params)

      if @post.save
        redirect_to @post, notice: 'Новость успешно создана!'
      else
        render :new
      end
  end

  def update
    authorize! :manage, @post

      if @post.update(post_params)
        redirect_to @post, notice: 'Новость успешно сохранена!'
      else
        render :edit 
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize! :manage, @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js {render :layout => false}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :source, :source_url, :user_id, :age_rating, :category)
    end
end

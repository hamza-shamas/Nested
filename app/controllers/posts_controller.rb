class PostsController < ApplicationController

    before_action :find_post, only:[:show, :edit, :update, :destroy]
    before_action :get_shark

    def index
        @posts = @shark.posts
    end

    def new
        @post = @shark.posts.build
    end
    
    def create
        # binding.pry
        @post = @shark.posts.build(post_params)
        if @post.save
            redirect_to shark_posts_path(@shark)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to shark_posts_path(@shark)
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
    end


    private
    def find_post
        @post = Post.find(params[:id])
    end
    
    def get_shark
        @shark = Shark.find(params[:shark_id])
    end

    def post_params
        params.require(:post).permit(:content, :shark_id)
    end
end

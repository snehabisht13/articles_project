class ArticlesController < ApplicationController
    before_action :articles_id, only: [:show, :edit, :update, :destroy]
    def show
        
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was saved successfully"
            redirect_to article_path(@article)
        else
            render "new"
        end
    end

    def edit
       
    end

    def update
        
        if @article.update(article_params)
            flash[:notice] = "Updated"
            redirect_to @article
        else
            render 'edit'
        end

    end

    def destroy
        
        @article.destroy
        redirect_to articles_path
    end

    private 
    def articles_id
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end


end

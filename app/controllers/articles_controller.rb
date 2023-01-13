class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only: %i[ show edit update destroy ]

    def index
        if current_user.admin?
            @articles = Article.all
          else
            @articles = Article.where(user_id: current_user.id)
        end
    end

    def show
    end

    def new
        @article = current_user.articles.new
    end

    def edit
    end

    def create
        @article = current_user.articles.new(article_params)

        respond_to do |format|
            if @article.save
                format.turbo_stream
                format.html { redirect_to article_url(@article), notice: "Articvle was successfully craeted." }
                format.json { render :show, status: :created, location: @article }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @article.update(article_params)
                format.turbo_stream
                format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
                format.json { render :show, status: :ok, location: @article }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        article.destroy

        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to articles_url, notice: "Article was successfully destroyed" }
            format.json { head :no_content }
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content, :user_id)
    end
end

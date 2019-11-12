class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json

  def index
    # @users = User.all
    # paginate
    @users = User.paginate(page: params[:page], per_page: 2)

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #
    # id = params[:id].to_i
    # id = id -8
    # @article = Article.find(id)
     # @article = Article.find(params[:id])
     @user_articles = @user.articles.paginate(page: params[:page], per_page: 1)

  end

  # GET /articles/new
  def new
     @user = User.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create



    @user = User.new(user_params)


    respond_to do |format|
      if @user.save

         format.html { redirect_to @user , notice: 'User was successfully created.' }
        format.json { render :action => "show", status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      # format.html { redirect_to articles_url }
       format.html { redirect_to user_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)

    end
end

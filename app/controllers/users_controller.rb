class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy suspend ban activate ]
  before_action :require_login, except: [:new, :create ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: "Sign up successful. Please log in." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if current_user.is_admin?
          format.html { redirect_to users_path, notice: "User was successfully updated." }
        else
          format.html { redirect_to '/userhome', notice: "User was successfully updated." }
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
 

  def per_update
    @user = User.find(params[:id])
     # Fetch the user
  end

  # PATCH /users/1/suspend
  def suspend
    if @user.update(acc_status: "Suspended")
      redirect_to @user, notice: "User has been suspended."
    else
      redirect_to @user, alert: "Failed to suspend user."
    end
  end

  # PATCH /users/1/ban
  def ban
    if @user.update(acc_status: "Banned")
      redirect_to @user, notice: "User has been banned."
    else
      redirect_to @user, alert: "Failed to ban user."
    end
  end

  # PATCH /users/1/activate
  def activate
    if @user.update(acc_status: "Active")
      redirect_to @user, notice: "User has been reactivated."
    else
      redirect_to @user, alert: "Failed to reactivate user."
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :is_admin, :acc_status)
    end
end

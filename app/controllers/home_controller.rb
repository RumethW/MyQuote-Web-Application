class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:user, :author)
                   .where(is_public: true) # Filter only public quotes
                   .order(created_at: :desc)
                   .limit(6)
  end

  def uindex
    @quotes = Quote.includes(:author)
               .where(is_public: true)  # Ensure only public quotes are fetched
               .order(created_at: :desc)  # Order by most recently added

  end

  def aindex
    @quotes = Quote.includes(:author)
               .where(is_public: true)  # Ensure only public quotes are fetched
               .order(created_at: :desc)  # Order by most recently added
  end

  def uquotes
    @quotes = Quote.includes(:author).where(user_id: session[:user_id])
  end

  def udetails
    @user = current_user
  end
  
  def edit
    # @user will be preloaded for the edit form
  end

  def display
    @quote = Quote.find(params[:id])  # Find the quote by ID
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  def adetails
    @user = current_user # Assuming you're using some authentication system like Devise
  end

  private

  def set_user
    @user = current_user  # Assuming current_user is the logged-in user
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :email, user_id, :acc_status)
  end

end
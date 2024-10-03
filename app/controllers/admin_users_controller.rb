class AdminUsersController < ApplicationController
  layout 'admin'
  def index
    @users = AdminUser.sorted
  end

  def create
  end

  def edit
    @user = AdminUser.find(params[:id])
  end

  def update
    @user = AdminUser.find(params[:id])
    if @user.update_attributes(admin_user_params)
      flash[:notice] = "User updated successfully."
      redirect_to(:action => 'index')
    else 
      render('edit')
    end
  end

  def delete
  end
  
  def destroy
  end

  private
    def admin_user_params
      params.require(:admin_users).permit(:first_name, :last_name, :email, :username)
    end
end


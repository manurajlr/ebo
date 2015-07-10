class Admin::UsersController < ApplicationController
	def index
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end

    def edit
       @user = User.find(params[:id])
       @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
    end

	def create
		@user=User.new(user_params)
		# @user.fname = params[:fname]
		if @user.is_active==true then @user.is_locked=false else @user.is_locked=true end
        if @user.save
	        redirect_to admin_user_path[:admin,@user]
	    else
            render 'new'
        end
	end

  def update
  @user = User.find(params[:id])
  @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
  if @user.update(user_params)
    redirect_to [:admin,@user]
  else
    render 'edit'
end
end

def destroy
    @article = User.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

	def new 
        @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
		@user = User.new
	end
end

private
  def user_params
    params.require(:user).permit(:first_name, :middle_name,:last_name,:email,:login,:password,:password_confirmation,:employee_id,:date_of_birth,:gender,:time_zone,:designation_id,:date_of_joining,:is_locked,:is_active,:education,:comments,:date_of_deactivation,:reason_for_deactivation,:work_phone)
  end
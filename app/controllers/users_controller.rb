class UsersController < ApplicationController
	def index
	end
	def show
		@user=User.find(params[:id])
	end

	def create
		@user=User.new(params.require(:user).permit(:first_name, :middle_name,:last_name,:email,:login,:password,:password_confirmation,:employee_id,:date_of_birth,:gender,:time_zone,:designation_id,:date_of_joining,:is_locked,:is_active,:education,:comments,:date_of_deactivation,:reason_for_deactivation,:work_phone))
		# @user.fname = params[:fname]
		if @user.is_active==true then @user.is_locked=false else @user.is_locked=true end
        if @user.save
	        redirect_to user_path(@user)
	    else
            render new_user_path
        end
	end

	def new 
        @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
		@user = User.new
	end
end

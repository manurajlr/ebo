class Admin::UsersController < ApplicationController
  load_and_authorize_resource except: [:create]
	def index
		@user=User.all
	end

  def new 
    @user = User.new
    @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
    @role_array=Role.all.map{|d|[d.name,d.id]}
  end

	def show
		@user=User.find(params[:id])
	end

  def edit
    @user = User.find(params[:id])
    @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
    @role_array=Role.all.map{|d|[d.name,d.id]}
  end

	def create
	  @user=User.new(user_params)
		# @user.fname = params[:fname]
		if @user.is_active==true then @user.is_locked=false else @user.is_locked=true end
        if @user.save
	        redirect_to [:admin,@user]
	      else
         @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
         @role_array=Role.all.map{|d|[d.name,d.id]}
         render :new
        end
	 end

  def update
    @user = User.find(params[:id])
    @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
    @role_array=Role.all.map{|d|[d.name,d.id]}
    if @user.update(user_params)
      redirect_to [:admin,@user]
    else
      @designation_array=Designation.all.map{|d|[d.designation_name,d.id]}
      @role_array=Role.all.map{|d|[d.name,d.id]}
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :middle_name,:last_name,:email,:login,:password,:password_confirmation,:employee_id,:date_of_birth,:gender,:time_zone,:designation_id,:date_of_joining,:is_locked,:is_active,:education,:comments,:date_of_deactivation,:reason_for_deactivation,:work_phone,:role_id)
    end

end
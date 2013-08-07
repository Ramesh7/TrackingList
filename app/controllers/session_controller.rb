class SessionController < ApplicationController
  skip_before_filter :login_required, :expire_session

  def new
    reset_session
    flash[:notice] = "Please enter valid user name and password"
  end

  def index; end

  def create
  	unless params[:user][:email].blank?
  		current_user = User.get_user(params[:user][:email]).first
  		if current_user && current_user.user_pass.authenticate_user(params[:user][:password])
  		  	set_session(current_user)
  		  	redirect_to welcome_index_path, notice: "Login Successfull"
  		else
  			flash[:notice] = "Please enter valid user name and password"
  			render :new
	  	end
  	else
  		flash[:notice] = "Please enter valid user name and password"
  		render :new
  	end
  end
  
  def new_user; end

  def create_user
  	@user = User.new(params[:user])
  	if @user.valid?
		ActiveRecord::Base.transaction do
		  @user.user_id = generate_user_id
		  @user.user_type = '0'
		  @user.save!
	  	  @user.create_user_pass!(password: params[:user][:password], user_id: @user.user_id)
	  	  contact_param = {address1: params[:user][:address1], address2: params[:user][:address2], contact_no: params[:user][:contact_no], user_id: @user.user_id}
	  	  @user.create_contact_info!(contact_param)
	  	  set_session(@user)
	  	end
	  	redirect_to welcome_index_path, notice: "Login Successfully"
  	else
  	  render :new_user
  	end
  end
  
  def destroy
    reset_session
    redirect_to root_path, notice: "Logout Successfull"
  end

  private

  def generate_user_id
  	Time.now.strftime("%Y%m%d")[0..10]
  end
end

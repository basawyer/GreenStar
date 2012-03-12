class UsersController < ApplicationController
  #before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
    @title = "All users"
    #@users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def outlet_detail
  	@user = User.authenticate_with_salt(*cookies.signed[:remember_token])
  end
  
  def outlets
  	@user = User.authenticate_with_salt(*cookies.signed[:remember_token])
  end
  
 def get_latest_slot_readings
 	readings = Hash.new
 	@user = User.authenticate_with_salt(*cookies.signed[:remember_token])
 	@user.units.each do |u|
 		u.slots.each do |s|
 			readings[s.id] = s.data_points.last
 			#readings[s.id].val = 30 + rand(30)
 		end
 	end
 	
 	render :json => readings
 end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def register_unit
#  	flash[:success] = params[:uid]
 # 	redirect_to("/outlets")
  	@unit_w = Unit.where("uid = ?", params[:uid])
  		if !@unit_w.empty?
  			@u = @unit_w.first
  			if @u.user_id.nil?
  				@u.user_id = params[:user_id]
  				if @u.save
  					flash[:success] = "Product added to your profile."
  					redirect_to("/outlets");
  				end
  			else
  				flash[:fail] = "Product already registered to user."
  				redirect_to("/outlets")
  			end
  		else
  			flash[:fail] = "Product does not exist."
  			redirect_to("/outlets")
  		end  		
  end
  
  def update_label
  	@slot = Slot.find(params[:slot_id])
  	@slot.label = params[:label]
  	@slot.save
  	redirect_to("/outlets")
  end

  def create
	@user = User.new(params[:user])
	if @user.password.nil?
	  check = true
	  @user.name = "Newsletter User"
	  @user.password = "password"
	end
	if @user.save
	  # for newsletter users
	  if check
		flash[:success] = "Success joining newsletter!"
		redirect_to(root_path)
	  else
		sign_in @user
		flash[:success] = "Welcome to the Sample App!"
		redirect_to @user      
	  end
	else
	  @title = "Sign up"
	  render 'new'
	end
  end
  

  def edit
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end

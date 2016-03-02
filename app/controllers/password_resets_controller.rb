class PasswordResetsController < ApplicationController

before_action :require_no_user
before_action :load_user_using_perishable_token, :only => [:edit, :update]

def new
	render
end

def edit
	render
end

def create
	@user = User.find_by_email(params[:email])
	if @user
		@user.deliver_password_reset_instructions!
		flash[:notice] = "Instructions to reset your password have been emailed to you." +
										"Please check your email to continue with resetting your password."
		redirect_to root_url
	else
		flash[:notice] = "No user was found with that email address."
		render :action => :new
	end
end

def update
	@user.password = params[:user][:password]
	@user.password_confirmation = params[:user][:password_confirmation]
	
	respond_to do |format|
		if @user.save
		    format.html { redirect_to root_url, notice: 'Password successfully changed' }
		else
		    format.html { redirect_to edit_password_resets_path, notice: 'Password not updated' }
		end
	    end

#	if @user.save
#		flash[:notice] = "Password successfully updated"
#		redirect_to @user #root_url
#	else
#		flash[:notice] = "Password not updated"
#		render :action => :edit
#	end
end

private
def load_user_using_perishable_token
	@user = User.find_using_perishable_token(params[:id])
	unless @user
		flash[:notice] = "we're sorry, but we could not locate your account. " +
		"If you are having issues, try copying and pasting the URL " +
		"from your email into your browser or restarting the " +
		"password reset process."
		redirect_to root_url
	end
end

end

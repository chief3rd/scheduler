class UserSessionsController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => :destroy

    def new
      @user_session = UserSession.new
    end
    # POST /users session
    # POST /users_session.xml
    def create
      @user_session = UserSession.new(params[:user_session])
      respond_to do |format|
        if @user_session.save
          format.html { redirect_to(root_url, :notice => 'Login Successful') }
          format.xml  { render :xml => @user_session, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      current_user_session.destroy
      respond_to do |format|
        format.html { redirect_to(new_user_session_url, :notice => 'Logout Successful') }
        format.xml  { head :ok }
      end
    end
end

class UserSessionsController < ApplicationController

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      flash[:notice] = "Login successful!"

      redirect_to '/dashboard'
    else
      Rails.logger.info("Failed login for #{params[:email]}")
      flash[:notice] = "Username / Password Not Recognized"
      render :action => :new
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to new_session_url
  end
end

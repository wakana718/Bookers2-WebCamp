class RelationshipsController < ApplicationController
  def follow
  current_user.follow(params[:id])
  redirect_to request.referer
  end

  def unfollow
  current_user.unfollow(params[:id])
  redirect_to request.referer
  end



  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        NotificationMailer.complete_mail(@user).deliver_now  # (1)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end






end

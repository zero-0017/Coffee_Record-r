# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(3)
    @users = User.where.not(name: "ゲストユーザー").page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path, notice: "会員情報の変更内容を保存しました"
  end

  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :is_deleted)
    end
end

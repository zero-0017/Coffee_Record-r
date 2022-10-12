class Admin::CategorysController < ApplicationController
  def index
    @category = Category.new
    @categorys = Category.page(params[:page]).per(9)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categorys_path, notice: "珈琲の種類名を作成しました"
    else
      @categorys = Category.page(params[:page]).per(9)
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
      redirect_to admin_categorys_path, notice: "珈琲の種類名を削除しました"
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categorys_path, notice: "珈琲の種類名の変更内容を保存しました"
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end
end

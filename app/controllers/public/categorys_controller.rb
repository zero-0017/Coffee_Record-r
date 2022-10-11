class Public::CategorysController < ApplicationController
  def show
    @categorys = Category.all
    @tags = Tag.all
    @genres_list = Genre.all
    @category = Category.find(params[:id])
    @category_post_coffees = PostCoffee.published.where(category_id: @category.id).page(params[:page])
  end
end
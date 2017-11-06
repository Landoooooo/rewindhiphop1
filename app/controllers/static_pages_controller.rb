class StaticPagesController < ApplicationController
  def home
  	@post = Post.all
  end

  def tapes
  end

  def user
  end
end

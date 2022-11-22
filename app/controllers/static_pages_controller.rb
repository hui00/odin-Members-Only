class StaticPagesController < ApplicationController
  def landing_page
    @Post = Post.all
  end

  def dashboard
  end
end

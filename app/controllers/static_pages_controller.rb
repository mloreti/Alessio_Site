class StaticPagesController < ApplicationController
  def contact
  end

  def index
    @post = Post.where(main_page: true)
  end
end

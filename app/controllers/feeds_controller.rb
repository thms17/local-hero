class FeedsController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @questions = Question.all
    @tasks = Task.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
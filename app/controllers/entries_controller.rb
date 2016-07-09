class EntriesController < ApplicationController
  def index
    @entry = Entry.new
  end

  def create
    redirect_to index
  end
end

class EntriesController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.all
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    flash[:notice] = "Your message was saved. Thank you."
    redirect_to entries_path
  end

  private

  def entry_params
     params.require(:entry).permit(:name, :message)
  end
end

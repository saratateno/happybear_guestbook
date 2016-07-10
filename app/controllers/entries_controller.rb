class EntriesController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.order('created_at').reverse_order
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = 'Your message was saved. Thank you.'
      redirect_to root_path
    else
      @entries = Entry.all
      render :index
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :message)
  end
end

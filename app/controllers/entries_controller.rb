class EntriesController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.all
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

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:notice] = 'The message was deleted.'
    redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :message)
  end
end

class RecordsController < ApplicationController

  def index
    if logged_in?
      @record = current_user.records.build #form with用
      @records = current_user.records.order(id: :desc).page(params[:page])
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

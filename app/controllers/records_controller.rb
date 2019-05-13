class RecordsController < ApplicationController
  before_action :record, only: [:show, :edit, :update, :destroy]

  def index
    @records = current_user.records
  end

  def show
    render :show
  end

  def new
    @record = Record.new
  end

  def edit
    render :edit
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user

    if @record.save
      redirect_to @record, notice: 'Record was successfully created.'
    else
      render :new
    end
  end

  def update
    if record.update(record_params)
      redirect_to record, notice: 'Record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    record.destroy

    redirect_to records_url, notice: 'Record was successfully destroyed.'
  end

  private

  def record
    @record ||= Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(
      :name,
      :description,
      :value
    )
  end
end

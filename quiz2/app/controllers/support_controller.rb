class SupportController < ApplicationController
  before_action :find_support, only: [:show, :destroy, :edit, :update, :progress_change]

  def new
    @support = Support.new
  end

  def create
    support_params = params.require(:support).permit([:name, :email, :department, :message])
    @support = Support.new support_params

    if @support.save
      redirect_to supports_path
    else
      render :new
    end
  end

  def show
    @support = Support.find params[:id]
  end

  def search
    @supports2 = Support.search params[:keyword]
    @supports = @supports2.order(created_at: :desc).
                                  page(params[:page]).
                                  per(7)
  end

  def index
    @support = Support.order(created_at: :desc).page(params[:page]).per(7)
  end
  def edit
    @support = Support.find params[:id]
  end

  def update
    @support = Support.find params[:id]
    if @support.present?
      @support.update support_params
    end
    redirect_to support_path(@support)
  end

  def progress_change
    if @support.undone == true
      @support.undone = false
      @support.save
      redirect_to :back
    else
      @support.undone = true
      @support.save
      redirect_to :back
    end
  end

  def destroy
    @support = Support.find params[:id]
    if @support.present?
      @support.destroy
    end
    redirect_to supports_path
  end


private
  def find_support
    @support = Support.find params[:id]
  end
  def support_params
    params.require(:support).permit([:name, :email, :department, :message])
  end
end

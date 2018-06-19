class Admin::OptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET /admin/options
  def index
    @options = Option.all
  end

  # GET /admin/options/index
  def show
  end

  # GET /admin/options/new
  def new
    @option = Option.new
  end

  # GET /admin/options/index/edit
  def edit
  end

  # POST /admin/options
  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: 'Option was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PUT /admin/options/index
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: 'Option was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/options/index
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: 'Option was successfully deleted.' }
    end
  end

  private
    # Callbacks
    def set_option
      @option = Option.find(params[:id])
    end

    # Trusted parameters
    def option_params
      params.require(:option).permit(:name)
    end
end

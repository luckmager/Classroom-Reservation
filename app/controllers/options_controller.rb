class OptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET /options
  def index
    @options = Option.all
  end

  # GET /options/index
  def show
  end

  # GET /options/new
  def new
    @option = Option.new
  end

  # GET /options/index/edit
  def edit
  end

  # POST /options
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

  # PUT /options/index
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: 'Option was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /options/index
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: 'Option was successfully destroyed.' }
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

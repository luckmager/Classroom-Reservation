class Admin::ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :set_building, only: [:show, :new, :create, :edit, :update, :destroy]

  # GET /classrooms
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  def show
	  @reservation = Reservation.new
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @building.classrooms << @classroom
        format.html { redirect_to admin_building_path(@building), notice: 'Classroom was successfully created.' }
      else
        format.html { redirect_to new_admin_building_classroom_path(@building, @classroom), notice: 'Please fill in all the fields' }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to admin_building_path(@building), notice: 'Classroom was successfully updated.' }
      else
        format.html { redirect_to edit_admin_building_classroom_path(@building, @classroom), notice: 'Please fill in all the fields' }
      end
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to admin_building_path(@building), notice: 'Classroom #{@classroom.name} was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def set_building
      @building = Building.find(params[:building_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:name, :max_persons, :option_ids => [])
    end
end

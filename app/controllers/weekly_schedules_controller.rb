class WeeklySchedulesController < ApplicationController
  before_action :set_weekly_schedule, only: [:show, :edit, :update, :destroy]

  # GET /weekly_schedules
  # GET /weekly_schedules.json
  def index
    @weekly_schedules = WeeklySchedule.all
  end

  # GET /weekly_schedules/1
  # GET /weekly_schedules/1.json
  def show
  end

  # GET /weekly_schedules/new
  def new
    @weekly_schedule = WeeklySchedule.new
  end

  # GET /weekly_schedules/1/edit
  def edit
  end

  # POST /weekly_schedules
  # POST /weekly_schedules.json
  def create
    @weekly_schedule = WeeklySchedule.new(weekly_schedule_params)

    respond_to do |format|
      if @weekly_schedule.save
        format.html { redirect_to @weekly_schedule, notice: 'Weekly schedule was successfully created.' }
        format.json { render :show, status: :created, location: @weekly_schedule }
      else
        format.html { render :new }
        format.json { render json: @weekly_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_schedules/1
  # PATCH/PUT /weekly_schedules/1.json
  def update
    respond_to do |format|
      if @weekly_schedule.update(weekly_schedule_params)
        format.html { redirect_to @weekly_schedule, notice: 'Weekly schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekly_schedule }
      else
        format.html { render :edit }
        format.json { render json: @weekly_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_schedules/1
  # DELETE /weekly_schedules/1.json
  def destroy
    @weekly_schedule.destroy
    respond_to do |format|
      format.html { redirect_to weekly_schedules_url, notice: 'Weekly schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_schedule
      @weekly_schedule = WeeklySchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekly_schedule_params
      params.require(:weekly_schedule).permit(:week_day, :open_time, :close_time, :location)
    end
end

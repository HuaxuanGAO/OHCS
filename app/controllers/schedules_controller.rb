class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules or /schedules.json
  def index
    if user_signed_in?
      @user = current_user
      if @user.role == "patient" 
          @patient = Patient.find_by(user_id: @user.id)
      elsif @user.role == "doctor" 
          @doctor = Doctor.find_by(user_id: @user.id)
          @schedules = Schedule.where("doctor_id = #{@doctor.id}")
      end
    end
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    if user_signed_in?
      @user = current_user
      if @user.role == "patient" 
          @patient = Patient.find_by(user_id: @user.id)
      elsif @user.role == "doctor" 
          @doctor = Doctor.find_by(user_id: @user.id)
      end 
    end
    @schedule.doctor_id = @doctor.id

    respond_to do |format|
      if @schedule.save
        start_time = @schedule.start_time
        end_time = @schedule.end_time
        slots_array = Slot.new.generate_time_slots(start_time: start_time, end_time: end_time)
        slots_array.map { |slot_time| Slot.create!(schedule: @schedule, start_time: slot_time[0], end_time: slot_time[1]) }
        format.html { redirect_to @schedule, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        Slot.where(schedule: @schedule.id).destroy_all
        start_time = @schedule.start_time
        end_time = @schedule.end_time
        slots_array = Slot.new.generate_time_slots(start_time: start_time, end_time: end_time)
        slots_array.map { |slot_time| Slot.create!(schedule: @schedule, start_time: slot_time[0], end_time: slot_time[1]) }
        format.html { redirect_to @schedule, notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:start_time, :end_time, :doctor_id)
    end
end

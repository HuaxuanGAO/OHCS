class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    if current_user.role == "patient"
      @patient = Patient.where(user_id: current_user.id)[0]
      @appointments = Appointment.where(patient_id: @patient.id)
    elsif current_user.role == "doctor"
      @doctor = Doctor.where(user_id: current_user.id)[0]
      @appointments = Appointment.where(doctor_id: current_user.id)
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def calendar
    @appointments = Appointment.where(patient_id: current_user.id)
  end

  def select_department
  end

  def select_doctor
    department = params[:department]
    @doctors = Doctor.with_department(department)
    @users = []
    @doctors.each do |doc|
      id = doc.user_id
      user = User.find(id)
      name = "#{user.first_name} #{user.last_name}"
      @users << [name, doc.id]
    end
  end

  def select_from_calendar
    @id = params[:doc_id]
    @schedules = Schedule.where(doctor_id: @id)
  end

  def select_slot
    id = params[:schedule_id]
    @slots = Slot.where(schedule_id: id)
    @doc_id = params[:doc_id]
  end

  def confirm_slot
    @appointment = Appointment.new
    @slot_id = params[:slot_id]
    @doc_id = params[:doctor_id]
    @patient_id = params[:patient_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:name, :start_time, :end_time, :patient_id, :doctor_id, :slot_id)
    end
end

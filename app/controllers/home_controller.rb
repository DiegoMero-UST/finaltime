class HomeController < ApplicationController
  def index
    @users = User.all
    @selected_date = params[:date].present? ? Date.parse(params[:date]) : Date.current
    @time_records = TimeRecord.includes(:user)
                             .where(date: @selected_date)
                             .order(created_at: :desc)

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=\"Registro #{@selected_date.strftime("%d-%m-%Y")}.xlsx\""
      }
    end
  end

  def clock_in
    user = User.find(params[:user_id])
    existing_record = TimeRecord.find_by(user: user, date: Date.current)

    if existing_record
      flash[:alert] = "Ya se ha creado un registro de entrada para hoy"
    else
      TimeRecord.create!(
        user: user,
        date: Date.current,
        clock_in: Time.current,
        notes: "Registro de entrada"
      )
      flash[:notice] = "Entrada registrada exitosamente"
    end

    redirect_to root_path
  end

  def clock_out
    user = User.find(params[:user_id])
    record = TimeRecord.find_by(user: user, date: Date.current)

    if record.nil?
      flash[:alert] = "Primero debe clickear su hora de entrada"
    elsif record.clock_out.present?
      flash[:alert] = "Ya se ha registrado la salida para hoy"
    else
      record.update!(
        clock_out: Time.current,
        notes: record.notes + " | Registro de salida"
      )
      flash[:notice] = "Salida registrada exitosamente"
    end

    redirect_to root_path
  end

  def destroy
    record = TimeRecord.find(params[:id])
    record.destroy
    flash[:notice] = "Registro eliminado exitosamente"
    redirect_to root_path
  end
end

class ApplicationsController < ApplicationController
  expose(:application)
  expose(:applications)
  expose(:application_form){ NewApplicationForm.new(application_params, application: application) }

  def create
    respond_to do |format|
      if application_form.save
        format.html { redirect_to application_form.application, notice: 'application was successfully created.' }
        format.json { render :show, status: :created, location: application }
      else
        format.html { render :new }
        format.json { render json: application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if application_form.save
        format.html { redirect_to application_path(application_form.application), notice: 'application was successfully updated.' }
        format.json { render :show, status: :ok, location: application }
      else
        format.html { render :edit }
        format.json { render json: application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def application_params
    return {} unless params[:application].present?
    params.require(:application).permit(:date_request, :date_event_i, :date_event_f,
                                    :time_event, :event_code, :name_requesting,
                                    :phone_num, :place)
  end
end

class EventsController < ApplicationController
  expose(:event)
  expose(:events)
  expose(:event_form){ NewEventForm.new(event_params, event: event) }

  def create
    respond_to do |format|
      if event_form.save
        format.html { redirect_to event_form.event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: event }
      else
        format.html { render :new }
        format.json { render json: event_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if event_form.save
        format.html { redirect_to event_path(event_form.event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: event }
      else
        format.html { render :edit }
        format.json { render json: event_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    return {} unless params[:event].present?
    params.require(:event).permit(:code_event, :event_type, :ponente_name,
                                  :person_in_charge, :phone, :forniture)
  end
end

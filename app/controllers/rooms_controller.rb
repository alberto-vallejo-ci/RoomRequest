class RoomsController < ApplicationController
  expose(:room)
  expose(:rooms)
  expose(:room_form){ NewRoomForm.new(room_params, room: room) }

  def create
    respond_to do |format|
      if room_form.save
        format.html { redirect_to room_form.room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: room }
      else
        format.html { render :new }
        format.json { render json: room_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if room_form.save
        format.html { redirect_to room_path(room_form.room), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: room }
      else
        format.html { render :edit }
        format.json { render json: room_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def room_params
    return {} unless params[:room].present?
    params.require(:room).permit(:name, :capacity)
  end
end

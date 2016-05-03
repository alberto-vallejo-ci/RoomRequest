class AsistantsController < ApplicationController
  before_action :set_asistant, only: [:show, :edit, :update, :destroy]

  # GET /asistants
  # GET /asistants.json
  def index
    @asistants = Asistant.all
  end

  # GET /asistants/1
  # GET /asistants/1.json
  def show
  end

  # GET /asistants/new
  def new
    @asistant = Asistant.new
  end

  # GET /asistants/1/edit
  def edit
  end

  # POST /asistants
  # POST /asistants.json
  def create
    @asistant = Asistant.new(asistant_params)

    respond_to do |format|
      if @asistant.save
        format.html { redirect_to @asistant, notice: 'Asistant was successfully created.' }
        format.json { render :show, status: :created, location: @asistant }
      else
        format.html { render :new }
        format.json { render json: @asistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistants/1
  # PATCH/PUT /asistants/1.json
  def update
    respond_to do |format|
      if @asistant.update(asistant_params)
        format.html { redirect_to @asistant, notice: 'Asistant was successfully updated.' }
        format.json { render :show, status: :ok, location: @asistant }
      else
        format.html { render :edit }
        format.json { render json: @asistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistants/1
  # DELETE /asistants/1.json
  def destroy
    @asistant.destroy
    respond_to do |format|
      format.html { redirect_to asistants_url, notice: 'Asistant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistant
      @asistant = Asistant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistant_params
      params.require(:asistant).permit(:code, :name, :carer, :codeEvent)
    end
end

class CatalogesController < ApplicationController
  before_action :set_cataloge, only: %i[ show edit update destroy ]

  # GET /cataloges or /cataloges.json
  def index
    authorize Cataloge
    @cataloges = Cataloge.all
  end

  # GET /cataloges/1 or /cataloges/1.json
  def show
    authorize @cataloge
  end

  # GET /cataloges/new
  def new
    @cataloge = Cataloge.new 
    authorize @cataloge
  end

  # GET /cataloges/1/edit
  def edit
    authorize @cataloge
  end

  # POST /cataloges or /cataloges.json
  def create
    @cataloge = Cataloge.new(cataloge_params)
    authorize @cataloge

    respond_to do |format|
      if @cataloge.save
        format.html { redirect_to cataloge_url(@cataloge), notice: "Cataloge was successfully created." }
        format.json { render :show, status: :created, location: @cataloge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cataloge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cataloges/1 or /cataloges/1.json
  def update
    authorize @cataloge

    respond_to do |format|
      if @cataloge.update(cataloge_params)
        format.html { redirect_to cataloge_url(@cataloge), notice: "Cataloge was successfully updated." }
        format.json { render :show, status: :ok, location: @cataloge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cataloge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cataloges/1 or /cataloges/1.json
  def destroy
    authorize @cataloge
    
    @cataloge.destroy!

    respond_to do |format|
      format.html { redirect_to cataloges_url, notice: "Cataloge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cataloge
      @cataloge = Cataloge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cataloge_params
      params.require(:cataloge).permit(:title)
    end
end

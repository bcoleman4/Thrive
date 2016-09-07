class TwoOutputsController < ApplicationController
  before_action :set_two_output, only: [:show, :edit, :update, :destroy]
  

  # GET /two_outputs
  # GET /two_outputs.json
  def index
    @two_outputs = TwoOutput.all
  end

  # GET /two_outputs/1
  # GET /two_outputs/1.json
  def show
  end

  # GET /two_outputs/new
  def new
    @two_output = TwoOutput.new
  end

  # GET /two_outputs/1/edit
  def edit
  end

  # POST /two_outputs
  # POST /two_outputs.json
  def create
    @two_output = TwoOutput.new(two_output_params)

    respond_to do |format|
      if @two_output.save
        format.html { redirect_to @two_output, notice: 'Two output was successfully created.' }
        format.json { render :show, status: :created, location: @two_output }
      else
        format.html { render :new }
        format.json { render json: @two_output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /two_outputs/1
  # PATCH/PUT /two_outputs/1.json
  def update
    respond_to do |format|
      if @two_output.update(two_output_params)
        format.html { redirect_to @two_output, notice: 'Two output was successfully updated.' }
        format.json { render :show, status: :ok, location: @two_output }
      else
        format.html { render :edit }
        format.json { render json: @two_output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /two_outputs/1
  # DELETE /two_outputs/1.json
  def destroy
    @two_output.destroy
    respond_to do |format|
      format.html { redirect_to two_outputs_url, notice: 'Two output was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_two_output
      @two_output = TwoOutput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def two_output_params
      params.require(:two_output).permit(:O1, :O2)
    end
end

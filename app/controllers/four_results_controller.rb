class FourResultsController < ApplicationController
  before_action :set_four_result, only: [:show, :edit, :update, :destroy]

  # GET /four_results
  # GET /four_results.json
  def index
    @four_results = FourResult.all
  end

  # GET /four_results/1
  # GET /four_results/1.json
  def show
  end

  # GET /four_results/new
  def new
    @four_result = FourResult.new
  end

  # GET /four_results/1/edit
  def edit
  end

  # POST /four_results
  # POST /four_results.json
  def create
    @four_result = FourResult.new(four_result_params)

    respond_to do |format|
      if @four_result.save
        format.html { redirect_to @four_result, notice: 'Four result was successfully created.' }
        format.json { render :show, status: :created, location: @four_result }
      else
        format.html { render :new }
        format.json { render json: @four_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /four_results/1
  # PATCH/PUT /four_results/1.json
  def update
    respond_to do |format|
      if @four_result.update(four_result_params)
        format.html { redirect_to @four_result, notice: 'Four result was successfully updated.' }
        format.json { render :show, status: :ok, location: @four_result }
      else
        format.html { render :edit }
        format.json { render json: @four_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /four_results/1
  # DELETE /four_results/1.json
  def destroy
    @four_result.destroy
    respond_to do |format|
      format.html { redirect_to four_results_url, notice: 'Four result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_four_result
      @four_result = FourResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def four_result_params
      params.require(:four_result).permit(:R1, :R2, :R3, :R4)
    end
end

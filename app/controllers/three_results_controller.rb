class ThreeResultsController < ApplicationController
  before_action :set_three_result, only: [:show, :edit, :update, :destroy]

  # GET /three_results
  # GET /three_results.json
  def index
    @three_results = ThreeResult.all
  end

  # GET /three_results/1
  # GET /three_results/1.json
  def show
  end

  # GET /three_results/new
  def new
    @three_result = ThreeResult.new
  end

  # GET /three_results/1/edit
  def edit
  end

  # POST /three_results
  # POST /three_results.json
  def create
    @three_result = ThreeResult.new(three_result_params)

    respond_to do |format|
      if @three_result.save
        format.html { redirect_to @three_result, notice: 'Three result was successfully created.' }
        format.json { render :show, status: :created, location: @three_result }
      else
        format.html { render :new }
        format.json { render json: @three_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /three_results/1
  # PATCH/PUT /three_results/1.json
  def update
    respond_to do |format|
      if @three_result.update(three_result_params)
        format.html { redirect_to @three_result, notice: 'Three result was successfully updated.' }
        format.json { render :show, status: :ok, location: @three_result }
      else
        format.html { render :edit }
        format.json { render json: @three_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /three_results/1
  # DELETE /three_results/1.json
  def destroy
    @three_result.destroy
    respond_to do |format|
      format.html { redirect_to three_results_url, notice: 'Three result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_three_result
      @three_result = ThreeResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def three_result_params
      params.require(:three_result).permit(:R1, :R2, :R3)
    end
end

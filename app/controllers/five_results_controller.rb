class FiveResultsController < ApplicationController
  before_action :set_five_result, only: [:show, :edit, :update, :destroy]

  # GET /five_results
  # GET /five_results.json
  def index
    @five_results = FiveResult.all
  end

  # GET /five_results/1
  # GET /five_results/1.json
  def show
  end

  # GET /five_results/new
  def new
    @five_result = FiveResult.new
  end

  # GET /five_results/1/edit
  def edit
  end

  # POST /five_results
  # POST /five_results.json
  def create
    @five_result = FiveResult.new(five_result_params)

    respond_to do |format|
      if @five_result.save
        format.html { redirect_to @five_result, notice: 'Five result was successfully created.' }
        format.json { render :show, status: :created, location: @five_result }
      else
        format.html { render :new }
        format.json { render json: @five_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /five_results/1
  # PATCH/PUT /five_results/1.json
  def update
    respond_to do |format|
      if @five_result.update(five_result_params)
        format.html { redirect_to @five_result, notice: 'Five result was successfully updated.' }
        format.json { render :show, status: :ok, location: @five_result }
      else
        format.html { render :edit }
        format.json { render json: @five_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /five_results/1
  # DELETE /five_results/1.json
  def destroy
    @five_result.destroy
    respond_to do |format|
      format.html { redirect_to five_results_url, notice: 'Five result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_five_result
      @five_result = FiveResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def five_result_params
      params.require(:five_result).permit(:R1, :R2, :R3, :R4, :R5)
    end
end

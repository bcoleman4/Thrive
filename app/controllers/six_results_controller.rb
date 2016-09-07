class SixResultsController < ApplicationController
  before_action :set_six_result, only: [:show, :edit, :update, :destroy]

  
  def auto6    
    for fRes in 1..10
      for eRes in 1..10
        for dRes in 1..10
         for cRes in 1..10 
          for bRes in 1..10
            for aRes in 1..10
              @six_result = SixResult.new({"R1"=>aRes, "R2"=>bRes, "R3"=>cRes, "R4"=>dRes, "R5"=>eRes, "R6"=>fRes})
              @six_result.save
            end
          end
        end
      end
    end
  end
end

  # GET /six_results
  # GET /six_results.json
  def index
    @six_results = SixResult.all
  end

  # GET /six_results/1
  # GET /six_results/1.json
  def show
  end

  # GET /six_results/new
  def new
    @six_result = SixResult.new
  end

  # GET /six_results/1/edit
  def edit
  end

  # POST /six_results
  # POST /six_results.json
  def create
    @six_result = SixResult.new(six_result_params)

    respond_to do |format|
      if @six_result.save
        format.html { redirect_to @six_result, notice: 'Six result was successfully created.' }
        format.json { render :show, status: :created, location: @six_result }
      else
        format.html { render :new }
        format.json { render json: @six_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /six_results/1
  # PATCH/PUT /six_results/1.json
  def update
    respond_to do |format|
      if @six_result.update(six_result_params)
        format.html { redirect_to @six_result, notice: 'Six result was successfully updated.' }
        format.json { render :show, status: :ok, location: @six_result }
      else
        format.html { render :edit }
        format.json { render json: @six_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /six_results/1
  # DELETE /six_results/1.json
  def destroy
    @six_result.destroy
    respond_to do |format|
      format.html { redirect_to six_results_url, notice: 'Six result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_six_result
      @six_result = SixResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def six_result_params
      params.require(:six_result).permit(:R1, :R2, :R3, :R4, :R5, :R6)
    end
end

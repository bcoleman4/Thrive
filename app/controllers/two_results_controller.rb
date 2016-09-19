class TwoResultsController < ApplicationController
  before_action :set_two_result, only: [:show, :edit, :update, :destroy]


  # GET /two_results
  # GET /two_results.json
  def index
    @two_results = TwoResult.all
  end

  # GET /two_results/1
  # GET /two_results/1.json
  def show
  end

  # GET /two_results/new
  def new
    @two_result = TwoResult.new
  end

  def newb
    p "made it"
  end

  # GET /two_results/1/edit
  def edit
  end

  # POST /two_results
  # POST /two_results.json
  def create
    @two_result = TwoResult.new(two_result_params)

    respond_to do |format|
      if @two_result.save
        format.html { redirect_to '/two_result/'+ TwoResult.find(params[:id]) + '/edit', notice: 'Two result was successfully created.' }
        format.json { render :show, status: :created, location: @two_result }
      else
        format.html { render :new }
        format.json { render json: @two_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /two_results/1
  # PATCH/PUT /two_results/1.json
  def update
    respond_to do |format|
      if @two_result.update(two_result_params)
        format.html { redirect_to @two_result, notice: 'Two result was successfully updated.' }
        format.json { render :show, status: :ok, location: @two_result }
      else
        format.html { render :edit }
        format.json { render json: @two_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /two_results/1
  # DELETE /two_results/1.json
  def destroy
    @two_result.destroy
    respond_to do |format|
      format.html { redirect_to two_results_url, notice: 'Two result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_two_result
      @two_result = TwoResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def two_result_params
      params.require(:two_result).permit(:R1, :R2)
    end
end

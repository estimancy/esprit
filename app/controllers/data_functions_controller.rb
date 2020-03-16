class DataFunctionsController < ApplicationController
  before_action :set_data_function, only: [:show, :edit, :update, :destroy]

  # GET /data_functions
  # GET /data_functions.json
  def index
    @data_functions = DataFunction.all
  end

  # GET /data_functions/1
  # GET /data_functions/1.json
  def show
  end

  # GET /data_functions/new
  def new
    @data_function = DataFunction.new
  end

  # GET /data_functions/1/edit
  def edit
  end

  # POST /data_functions
  # POST /data_functions.json
  def create
    @data_function = DataFunction.new(data_function_params)

    respond_to do |format|
      if @data_function.save
        format.html { redirect_to @data_function, notice: 'Data function was successfully created.' }
        format.json { render :show, status: :created, location: @data_function }
      else
        format.html { render :new }
        format.json { render json: @data_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_functions/1
  # PATCH/PUT /data_functions/1.json
  def update
    respond_to do |format|
      if @data_function.update(data_function_params)
        format.html { redirect_to @data_function, notice: 'Data function was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_function }
      else
        format.html { render :edit }
        format.json { render json: @data_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_functions/1
  # DELETE /data_functions/1.json
  def destroy
    @data_function.destroy
    respond_to do |format|
      format.html { redirect_to data_functions_url, notice: 'Data function was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_function
      @data_function = DataFunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_function_params
      params.require(:data_function).permit(:requirement_id, :content, :attribute, :type, :ret)
    end
end

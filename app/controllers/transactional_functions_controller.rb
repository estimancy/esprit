class TransactionalFunctionsController < ApplicationController
  before_action :set_transactional_function, only: [:show, :edit, :update, :destroy]

  # GET /transactional_functions
  # GET /transactional_functions.json
  def index
    @transactional_functions = TransactionalFunction.all
  end

  # GET /transactional_functions/1
  # GET /transactional_functions/1.json
  def show
  end

  # GET /transactional_functions/new
  def new
    @transactional_function = TransactionalFunction.new
  end

  # GET /transactional_functions/1/edit
  def edit
  end

  # POST /transactional_functions
  # POST /transactional_functions.json
  def create
    @transactional_function = TransactionalFunction.new(transactional_function_params)

    respond_to do |format|
      if @transactional_function.save
        format.html { redirect_to @transactional_function, notice: 'Transactional function was successfully created.' }
        format.json { render :show, status: :created, location: @transactional_function }
      else
        format.html { render :new }
        format.json { render json: @transactional_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactional_functions/1
  # PATCH/PUT /transactional_functions/1.json
  def update
    respond_to do |format|
      if @transactional_function.update(transactional_function_params)
        format.html { redirect_to @transactional_function, notice: 'Transactional function was successfully updated.' }
        format.json { render :show, status: :ok, location: @transactional_function }
      else
        format.html { render :edit }
        format.json { render json: @transactional_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactional_functions/1
  # DELETE /transactional_functions/1.json
  def destroy
    @transactional_function.destroy
    respond_to do |format|
      format.html { redirect_to transactional_functions_url, notice: 'Transactional function was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transactional_function
      @transactional_function = TransactionalFunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transactional_function_params
      params.require(:transactional_function).permit(:requirement_id, :content, :type, :traceability, :det)
    end
end

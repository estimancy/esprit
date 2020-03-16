class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def import_requirements_file

    Requirement.delete_all
    TransactionalFunction.delete_all
    DataFunction.delete_all

    tab_error = []

    if params[:file].nil?
      flash[:error] = "Erreur : pas de fichier"
    elsif !params[:file].nil? && (File.extname(params[:file].original_filename) == ".xlsx" || File.extname(params[:file].original_filename) == ".Xlsx")

      workbook = RubyXL::Parser.parse(params[:file].path)

      worksheet0 = workbook[0]
      worksheet2 = workbook[2]

      worksheet0.each_with_index do |row, index|
        if index > 0
          requirement = Requirement.where(content: row[5].nil? ? "" : row[5].value).first

          if requirement.nil?

            requirement = Requirement.create(content: row[5].nil? ? nil : row[5].value,
                                             storypoint: row[5].nil? ? nil : row[5].value)

          end

          TransactionalFunction.create(requirement_id: requirement.id,
                                       content: row[5].nil? ? nil : row[5].value,
                                       tf_type: row[6].nil? ? "" : row[6].value,
                                       traceability: row[12].nil? ? "" : row[12].value)
        end
      end
    end

    worksheet2.each do |row|
      DataFunction.create(content: row[0].nil? ? nil : row[0].value,
                          data_type: row[1].nil? ? "" : row[1].value,
                          ret: row[2].nil? ? "" : row[2].value,
                          data_attribute: row[3].nil? ? "" : row[3].value)
    end

    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_params
      params.require(:requirement).permit(:content, :storypoint)
    end
end

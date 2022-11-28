class Backoffice::CompaniesController < BackofficeController
  skip_before_action :verify_authenticity_token
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = policy_scope(Company.all)
  end

  def show
  end

  def new
    @company = Company.new
    authorize @company
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    respond_to do |format|
      if @company.save
        format.html { redirect_to backoffice_companies_path, notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to backoffice_company_path(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to backoffice_companies_path, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
      authorize @company
    end

    def company_params
      params.require(:company).permit(:name, :cnpj, :legal_representative, :phone_number, :email)
    end
end

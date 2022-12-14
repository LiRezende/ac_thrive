class Backoffice::DocumentsController < BackofficeController
  before_action :set_document, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @documents = Document.all
  end

  def show
  end

  def new
    @document = Document.new
    if !current_user.has_role?(:Administrador) && @person.id != current_user.person.id
      flash[:error] = 'Você não tem permissão para fazer esta ação.'
      redirect_to "/backoffice/home/index"
    end
  end

  def edit
    if !current_user.has_role?(:Administrador) && @person.id != current_user.person.id
      flash[:error] = 'Você não tem permissão para fazer esta ação.'
      redirect_to "/backoffice/home/index"
    end
  end

  def create
    @document = Document.new(document_params)
    
    if current_user.has_role?(:Administrador) 
      @document.person_id = @person.id
    else
      @document.person_id = current_user.person.id
    end

    if @document.save
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Documentos registrados com sucesso!"  
    else
      render :create
    end
  end

  def update
    document = Document.find(params[:id])
    params_document = params.require(:document).permit(:identity, :expeditor, :cpf, :nacionality, :father_name, :mother_name)
    
    if document.update(params_document)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Documentos atualizados com sucesso!"
    else
      render :edit
    end
  end

  
  private
  def document_params
    params.require(:document).permit(:identity, :expeditor, :cpf, :nacionality, :father_name, :mother_name)
  end
    
  def set_document
    @document = Document.find(params[:id])
  end

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
    @person = @user.person
    @document = @person.document
  end
end
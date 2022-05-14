class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    @project = Project.new
    @project.stages.build
    @current_ptoject = if params[:id].present? 
                        @projects.find(params[:id])
                      else
                        @projects.last
                      end
    @ticket = Ticket.new
    @stages = @current_ptoject.stages
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path(id: @project.id), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path(id: @project.id), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sort
    stage = Stage.find(params[:id])
    stage.update(position: params[:position])
  end

  def sort_ticket
    ticket = Ticket.find(params[:id])
    ticket.update(position: params[:position], stage_id: params[:stage])
  end

  def create_ticket
    ticket_project = params[:id]
    ticket = Ticket.new(ticket_params)
    ticket.save
    redirect_to projects_path(id:ticket_project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, stages_attributes: [:id, :name, :color])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description, :stage_id)
    end
end

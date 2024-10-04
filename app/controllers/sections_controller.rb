class SectionsController < ApplicationController
  layout "admin"

  # protect pages for unauthenticate users 
  before_action :confirmed_logged_in
  before_action :find_page

  def index
    # @sections = Section.where(:page_id => @page.id).sorted
      @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => 'default'})
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    @section_count = Section.count + 1
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      render('new')
    end
  end
  
  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
  end

  def update 
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section Updated successfully!"
      redirect_to(action:'index', :page_id => @page.id)
    else
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy 
    section = Section.find(params[:id]).destroy
    flash[:notice] = "#{section.name} deleted successfully"
    redirect_to(action: 'index', :page_id => @page.id)
  end

  private 
    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end

    def find_page
     if params[:page_id]
       @page = Page.find(params[:page_id])
     end
    end
end

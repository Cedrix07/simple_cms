class SubjectsController < ApplicationController

  layout "admin"
  
  # protect pages for unauthenticate users 
  before_action :confirmed_logged_in  
  
  def index
    @subjects = Subject.sorted
    # render(:template => 'subjects/index')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    # instantiate a new object using form params
    @subject= Subject.new(subject_params)

    #save the object
   if @subject.save
      flash[:notice] = "Subject created successfully!"
      redirect_to(:action => 'index')
   else
      @subject_count = Subject.count + 1
      render('new')
   end
  end
  
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
      # Find an existing object using form params
      @subject = Subject.find(params[:id])

      #update the object
     if @subject.update_attributes(subject_params)
       flash[:notice] = "Subject updated successfully!"
      redirect_to(:action => 'show', :id => @subject.id)
     else
      @subject_count = Subject.count 
      render('edit')
     end
  end

  def delete  
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully!"
    redirect_to(:action => 'index')
  end


  private 
    # same as using "params[:subject], except that it:"
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    def subject_params
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end
end

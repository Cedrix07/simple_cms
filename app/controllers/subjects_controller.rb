class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
    # render(:template => 'subjects/index')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # instantiate a new object using form params
    @subject= Subject.new(subject_params)

    #save the object
   if @subject.save
    redirect_to(:action => 'index')
   else
    render('new')
   end
    
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end

  def update
      # Find an existing object using form params
      @subject = Subject.find(params[:id])

      #updaye the object
     if @subject.update_attributes(subject_params)
      redirect_to(:action => 'show', :id => @subject.id)
     else
      render('edit')
     end
  end

  def delete  
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  private 
    # same as using "params[:subject], except that it:"
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end

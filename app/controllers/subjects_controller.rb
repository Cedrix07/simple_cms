class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
    render(:template => 'subjects/index')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})

  end

  def edit
    render(:template => 'subjects/index')
  end

  def delete
  end
end

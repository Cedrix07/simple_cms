class DemoController < ApplicationController
  
  layout false

  def index
  end
  
  def hello
    @listOfNames = ["cedrix", "kiba", "brim"]
    #convert params to integer 
    @id = params['id'].to_i
    @page = params[:page].to_i
    
  end

  def redirect_page
    redirect_to(:controller => 'demo', :action => 'index')
  end

  
end

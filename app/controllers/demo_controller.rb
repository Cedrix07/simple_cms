class DemoController < ApplicationController
  
  layout 'application'

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

  def text_helpers
    
  end

  def escape_output
    
  end
  def logging
    logger.debug("Hello debug")
    logger.info("Hello info ")
    logger.warn("Hello warn ")
    logger.fatal("Hello fatal ")
    render(:text => "Logged")
  end
end

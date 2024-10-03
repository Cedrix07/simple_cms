module ApplicationHelper
  
  def status_tag(boolean, options = {})
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end

  def format_date(date)
    date.to_s(:long)
  end

  def error_messages_for(object)
    # render(:partial => 'application/error_messages', :locals => { :object => object })
    render(partial: 'application/error_messages', locals: { object: object })
  end
end

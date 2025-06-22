module ApplicationHelper
  def flash_class(level)
    case level.to_s
    when 'notice' then 'alert-success'
    when 'success' then 'alert-success'
    when 'error' then 'alert-danger'
    when 'alert' then 'alert-warning'
    else 'alert-info'
    end
  end

  def markdown(text)
    return '' if text.blank?
    
    # Simple markdown-like formatting
    text = simple_format(text)
    text = text.gsub(/\*\*(.*?)\*\*/, '<strong>\1</strong>')
    text = text.gsub(/\*(.*?)\*/, '<em>\1</em>')
    text.html_safe
  end

  def truncate_words(text, length = 30)
    return '' if text.blank?
    
    words = text.split
    if words.length > length
      words[0...length].join(' ') + '...'
    else
      text
    end
  end
end
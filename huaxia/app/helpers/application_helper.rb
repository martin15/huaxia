module ApplicationHelper

  def msg_flash(flash)
    str = ""
    flash.each do |key, value|
      str += "<p class='#{key}'>#{value}</p><br />"
    end
    str+= "<br /><br />" unless flash.empty?
    return str
  end

  def short_desc(text, count)
    new_text_splited = text[0, count].split(" ")
    new_text_splited.pop(1)
    return new_text_splited.join(" ")
  end

  def active_menu(obj)
    return 'active-menu' if controller_name == obj
  end

  def target_url(url)
    unless url.include?("http://") 
      return "http://#{url}"
    end
  end

  def order_item
   [["Search by...", nil],
    ["Destination", "destination"],
    ["Origin", "origin"],
    ["Transit", "transit"]]

  end
end

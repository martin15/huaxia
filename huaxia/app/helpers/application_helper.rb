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
    return url
  end

  def order_item
   [["Search by...", nil],
    ["Destination", "destination"],
    ["Origin", "origin"],
    ["Transit", "transit"]]

  end

  def open_accordion(program, selected_program)
    return if selected_program.nil?
    "in" if program.id == selected_program.id
  end

  def display_icon(icon)
    if icon.exists?
      return(image_tag icon.url(:icon), :class => "sub-menu-icon")
    end
  end

  def display_icon_and_text(child_info)
    str = ""
    if child_info.sub_menu_icon.exists?
      str = "<span class='icon-side-menu'>
              #{image_tag child_info.sub_menu_icon.url(:icon), :class => "sub-menu-icon"}
             </span>"
    end
    if child_info.class == FeatureCategory
      str += "<span class='text-side-menu'>#{child_info.name.humanize}</span>"
    else
      str += "<span class='text-side-menu'>#{child_info.title.humanize}</span>"
    end
  end

  def accordion_with_image(icon)
    return icon.exists? ? "accordion-toggle-with-icon collapsed" : "accordion-toggle collapsed"
  end

  def flash_type(type)
     return 'danger' if type.to_s == 'recaptcha_error'
     return 'danger' if type.to_s == 'alert'
     return 'danger' if type.to_s == 'error'
     return 'success' if type.to_s == 'notice'
  end

end


class CardDecorator < Draper::Decorator
  delegate_all

  def icon_class
    html_string = ""

    if object.colors.include? 'Blue'
      html_string << '<i class="mi mi-u mi-mana"></i>'
    end

    if object.colors.include? 'Black'
      html_string << '<i class="mi mi-b mi-mana"></i>'
    end

    if object.colors.include? 'Red'
      html_string << '<i class="mi mi-r mi-mana"></i>'
    end

    if object.colors.include? 'Green'
      html_string << '<i class="mi mi-g mi-mana"></i>'
    end


    if object.colors.include? 'White'
      html_string << '<i class="mi mi-w mi-mana"></i>'
    end

    return html_string.html_safe
  end

  def html_text
    original_text = "<p>#{object.text}</p>"
    original_text.sub(/\n/, "</p><p>")
      .gsub(/{(?<f>[1-9])}/, '<i class="mi mi-mana mi-\k<f>"></i>')
      .gsub(/{R}/, '<i class="mi mi-r mi-mana"></i>')
      .gsub(/{W}/, '<i class="mi mi-w mi-mana"></i>')
      .gsub(/{G}/, '<i class="mi mi-g mi-mana"></i>')
      .gsub(/{U}/, '<i class="mi mi-u mi-mana"></i>')
      .gsub(/{B}/, '<i class="mi mi-b mi-mana"></i>')
      .gsub(/{T}/, '<i class="mi mi-t mi-mana"></i>')
      .html_safe
  end
end
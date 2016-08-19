module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                        no_intra_emphasis: true,
                                        fenced_code_blocks: true,
                                        disable_indented_code_blocks: true,
                                        space_after_headers: true,
                                        superscript: true,
                                        highlight: true)
    markdown.render(text).html_safe
  end

  def bootstrap_class_for(flash_type)
    flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert alert-#{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, "&times;".html_safe, class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
end

module AdminHelper
  def admin(&block)
    content_tag :div, class: 'admin' do
      block.call
    end
  end

  def submit_button(form, text)
    content = form.button(:button, text)
    content += link_to("Cancel", :back)
    content_tag(:div, content, class: "pure-controls")
  end
end

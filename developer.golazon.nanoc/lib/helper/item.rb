module ItemHelper
  def html_sidebar(opts = {})
    formatter.render_element doc, as: :root_objects_list, current_path: opts[:current_path]
  end
  memoize :html_sidebar

  def html_object(object)
    formatter.render_element object, as: :detailed
  end
  memoize :html_object
end
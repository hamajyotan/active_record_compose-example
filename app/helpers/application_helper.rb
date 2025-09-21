module ApplicationHelper
  def navigation_link_item(path, title:, icon:, active: false, **options, &block)
    tag.li class: %w[nav-item] do
      if active
        options[:class] = Array.wrap(options[:class]) << %w[nav-link active]
        options[:aria] = (options[:aria] ||= {})
        options[:aria][:current] = "page"
      else
        options[:class] = Array.wrap(options[:class]) << %w[nav-link]
      end

      link_to(path, **options) { with_icon(tag.span(title, class: "ml-3"), key: icon) }
    end
  end

  def navigation_delimiter = tag.li(class: %w[nav-item disabled]) { tag.hr }

  def with_icon(name = nil, key:, &block)
    if block_given?
      safe_join [ icon(key), yield ], " "
    else
      safe_join [ icon(key), name ], " "
    end
  end

  def icon(key)
    lucide_icon key
  end
end

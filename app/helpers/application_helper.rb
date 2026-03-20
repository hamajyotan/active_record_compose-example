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

      link_to(path, **options) { with_bi_icon(title, key: icon) }
    end
  end

  def navigation_delimiter = tag.li(class: %w[nav-item disabled]) { tag.hr }

  def with_bi_icon(name = nil, key:, &block)
    if block_given?
      safe_join [ bi_icon(key), yield ], " "
    else
      safe_join [ bi_icon(key), name ], " "
    end
  end

  def bi_icon(key)
    tag.i class: [ "bi", "bi-#{key}" ]
  end
end

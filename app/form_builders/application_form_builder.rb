class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  def model_base_error
    return if object.errors[:base].none?

    tag.ul class: %w[alert alert-warning list-unstyled], role: "alert" do
      safe_join object.errors[:base].map { tag.li _1 }
    end
  end

  def text_field(method, options = {})
    super(method, with_invalid_class(options, method))
  end

  def email_field(method, options = {})
    super(method, with_invalid_class(options, method))
  end

  def password_field(method, options = {})
    super(method, with_invalid_class(options, method))
  end

  def check_box(method, options = {})
    super(method, with_invalid_class(options, method))
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    super(method, choices, options, with_invalid_class(html_options, method), &block)
  end

  def invalid_feedback(method)
    return if object.errors[method].blank?

    safe_join object.errors[method].map { tag.div _1, class: %w[invalid-feedback] }
  end

  private

  attr_reader :template

  delegate :tag, :safe_join, :t, to: :template

  def with_invalid_class(options, method)
    options[:class] = Array.wrap(options[:class]) << "is-invalid" if object.errors[method].present?
    options
  end
end

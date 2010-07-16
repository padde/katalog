# remove ugly br tags in erroneous form fields
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  %Q{<span class="field_with_errors">#{html_tag}</span>}.html_safe
end
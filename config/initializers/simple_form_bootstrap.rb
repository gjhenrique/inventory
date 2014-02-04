# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|

  config.wrappers :bootstrap, tag: 'div', label_html: {class: 'col-xs-3' }, html: {class: 'form-horizontal'},
  class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label

    b.wrapper :right_col, tag: :div, class: 'col-xs-6' do |component|
      component.use :input
      component.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
      component.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :inline, tag: 'div', html: {class: 'form-inline'}, class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label

    b.wrapper :right_col, tag: :div do |component|
      component.use :input
      component.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
      component.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap


end

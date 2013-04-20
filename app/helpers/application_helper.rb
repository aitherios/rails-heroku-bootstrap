module ApplicationHelper
  def hidden_content_block name, options = {}, &block
    options[:editable] = false
    content_block name, options, &block
  end

  def content_block name, options = {}, &block
    content = ''
    name = name.to_s
    cb = ContentBlock.find_by_name name

    if cb.nil?
      content = capture(&block)
      ContentBlock.create! name: name, body: content
    else
      content = cb.body
    end

    if current_admin_user.present? and options[:editable] != false
      content = content_tag :div, content.html_safe, id: "content-block-#{cb.id}",
                                                     class: 'mercury-region',
                                                     data: { mercury: 'full' }
    end
      
    content.html_safe
  end
end

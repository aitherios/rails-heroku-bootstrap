module ApplicationHelper
  def code_content_block name, text = '', options = {}, &block
    if text.kind_of? Hash
      options = text
      text = nil
    end

    options[:editable] = false
    content_block name, text, options, &block
  end

  def content_block name, text = '', options = {}, &block
    name = name.to_s
    cb = ContentBlock.find_by_name name
    
    if text.kind_of? Hash
      options = text
      text = nil
    end

    content = block_given? ? capture(&block).to_s : text.to_s

    if cb.nil?
      ContentBlock.create! name: name, body: content, original_body: content
    else
      if cb.body == cb.original_body and cb.body != content
        cb.update_attributes! body: content, original_body: content
      end
      
      content = cb.body
    end

    if current_admin_user.present? and options[:editable] != false
      content = content_tag :span, content.html_safe, id: "content-block-#{cb.id}",
                                                      class: 'mercury-region',
                                                      data: { mercury: 'full' }
    end
      
    content.html_safe
  end
end

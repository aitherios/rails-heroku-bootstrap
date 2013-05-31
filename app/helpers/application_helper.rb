module ApplicationHelper
  def content_block name, content = ''
    name = name.to_s
    cb = ContentBlock.find_by_name name

    if cb.nil?
      cb = ContentBlock.create! name: name, body: content, original_body: content
    else
      if cb.body == cb.original_body and cb.body != content
        cb.update_attributes! body: content, original_body: content
      end
      cb.update_attributes! href: request.fullpath if cb.href.blank?
    end
      
    cb
  end

  def edit_on_mercury model, attr, options = {}
    if current_admin_user.present? and options[:editable] != false
      content_tag :span, model.send(attr).html_safe, id: "#{model.class.to_s.underscore}-#{model.id}-#{attr}",
                                               class: 'mercury-region mercury-content-region',
                                               data: { mercury: 'full'}
    else
      content_tag :span, model.send(attr).html_safe, id: "#{model.class.to_s.underscore}-#{model.id}-#{attr}",
                                               class: 'mercury-content-region'
    end
  end

  # editable_region :content_block_name, 'teste'
  #   gets and creates the content block :content_block_name with 'teste'
  #
  # editable_region :content_block_name, do 'teste' end
  #   gets and creates the content block :content_block_name with given block
  # 
  # editable_region :content_block_name, 'teste', editable: false
  #   gets and creates the non editable content block :content_block_name with 'teste'
  # 
  # editable_region :content_block_name, editable: false, do 'teste' end
  #   gets and creates the non editable content block :content_block_name with given block
  # 
  # editable_region Page.first, :title
  #   gets the given page model and exposes :title to editing
  # 
  def editable_region obj, attr = '', options = {}, &block
    if attr.kind_of? Hash
      options = attr
      attr = nil
    end
    content = block_given? ? capture(&block).to_s : attr.to_s

    if obj.kind_of?(String) or obj.kind_of?(Symbol)
      content_block(obj, content)
      edit_on_mercury ContentBlock.find_by_name(obj), :body, options
    else
      edit_on_mercury obj, attr, options if obj.present?
    end
  end
  alias :edit_me :editable_region

end

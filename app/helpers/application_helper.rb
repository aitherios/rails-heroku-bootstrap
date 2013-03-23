module ApplicationHelper
  def content_block name, &block
    body = ''

    name = name.to_s
    cb = ContentBlock.find_by_name name

    if cb.nil?
      body = capture(&block)
      ContentBlock.create! name: name, body: body
    else
      body = cb.body
    end

    body
  end
end

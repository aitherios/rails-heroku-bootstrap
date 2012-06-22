module DeviseHelper
  def devise_error_messages!(user=nil)
    user_resource = user.present? ? user : resource

    return "" if user_resource.errors.empty?

    messages = user_resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => user_resource.errors.count,
                      :user_resource => user_resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
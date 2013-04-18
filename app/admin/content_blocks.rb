ActiveAdmin.register ContentBlock do
  actions :all, except: [:destroy, :new]
  config.per_page = 10

  filter :name

  index do
    column :id
    column :name
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name, input_html: { disabled: true }
      f.input :body, input_html: { class: ( 'redactor' if f.object.body.match(/<\w/) ) }
    end

    f.actions
  end
    
  show title: :name do |content_block|
    attributes_table do
      row :name
      row :body do
        content_block.body.html_safe
      end
    end

    active_admin_comments
  end

end

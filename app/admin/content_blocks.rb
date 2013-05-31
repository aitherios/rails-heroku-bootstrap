# -*- coding: utf-8 -*-
ActiveAdmin.register ContentBlock do
  menu parent: I18n.t('app.active_admin.administration'), priority: 2
  actions :all, except: [:destroy, :new]

  config.per_page = 10
  config.sort_order = "name_asc"

  filter :name
  filter :body

  index do
    column :id
    column :name
    column :body
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name, input_html: { disabled: true }
      f.object.body.match(/<\w/) ? f.input(:body, as: :ckeditor) : f.input(:body)
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

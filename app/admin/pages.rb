ActiveAdmin.register Page do
  config.per_page = 10
  
  filter :title
  filter :content
  
  index do
    column :id
    column :slug
    column :title
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :content, as: :ckeditor
    end

    f.actions
  end

  show title: :title do |page|
    attributes_table do
      row :title
      row :slug
      row :content do
        page.content.html_safe
      end
    end

    active_admin_comments
  end
  
end

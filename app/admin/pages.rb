ActiveAdmin.register Page do
  config.per_page = 10
  form partial: 'form'
  
  filter :title
  filter :content
  
  index do
    column :id
    column :title
    default_actions
  end
  
  show do
    render partial: 'show'
  end
end

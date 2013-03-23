ActiveAdmin.register ContentBlock do
  config.per_page = 10

  filter :name

  index do
    column :id
    column :name
    default_actions
  end

  show title: :name do
    render partial: 'show'
  end

  form partial: 'form'
end

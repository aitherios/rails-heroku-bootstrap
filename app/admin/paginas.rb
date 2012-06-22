ActiveAdmin.register Pagina do
  form partial: 'form'
  
  filter :titulo
  filter :conteudo
  
  index do
    column :id
    column :titulo
    default_actions
  end
  
  show do
    render partial: 'show'
  end
end

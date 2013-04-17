ActiveAdmin.register AdminUser do
  config.per_page = 10
  filter :email

  index do
    column :id
    column :email
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  show title: :email do |admin_user|
    attributes_table do
      row :email
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end

end

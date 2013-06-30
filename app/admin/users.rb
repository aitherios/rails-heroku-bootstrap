ActiveAdmin.register User do
  menu parent: I18n.t('app.active_admin.administration'), priority: 3

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count

  index do
    column :id
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count             
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :avatar
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  show title: :email do |user|
    attributes_table do
      row :avatar do 
        image_tag user.avatar_url if user.avatar_url.present?
      end
      row :name
      row :email
      row :created_at
      row :updated_at
      row :current_sign_in_at           
      row :sign_in_count             
    end

    active_admin_comments
  end

end

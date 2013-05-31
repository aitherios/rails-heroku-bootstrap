# -*- coding: utf-8 -*-
ActiveAdmin.register AdminUser do
  menu parent: I18n.t('app.active_admin.administration'), priority: 1

  config.per_page = 10

  filter :email

  index do
    column :id
    column :email
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
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
      row :current_sign_in_at        
      row :last_sign_in_at           
      row :sign_in_count             
    end

    active_admin_comments
  end

end

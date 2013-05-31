# -*- coding: utf-8 -*-
ActiveAdmin.register Contact do
  menu parent: I18n.t('app.active_admin.reports'), priority: 1
  actions :all, except: [:destroy, :edit, :new]

  config.per_page = 10

  filter :name
  filter :email
  filter :message
  filter :created_at

  index do
    column :id
    column :name
    column :email
    column :created_at
    default_actions
  end

end

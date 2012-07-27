class ChangePaginaToPage < ActiveRecord::Migration
  def change
    rename_table :paginas, :pages
    rename_column :pages, :titulo, :title
    rename_column :pages, :conteudo, :content
  end
end

class CreatePaginas < ActiveRecord::Migration
  def change
    create_table :paginas do |t|
      t.string :titulo
      t.string :slug
      t.text :conteudo

      t.timestamps
    end
    add_index :paginas, :slug
  end
end

class Link < ActiveRecord::Migration
  def change
    add_column :links, :title, :string
    add_column :links, :url, :string
    add_column :links, :notes, :text
  end
end

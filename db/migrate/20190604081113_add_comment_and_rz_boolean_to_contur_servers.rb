class AddCommentAndRzBooleanToConturServers < ActiveRecord::Migration[5.2]
  def change
    add_column :contur_servers, :comment, :text
    add_column :contur_servers, :rz_access, :boolean, default: false
  end
end

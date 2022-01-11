class AddActiveDefaultToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :memberships, :active, :boolean, default: true, null: false
  end
end

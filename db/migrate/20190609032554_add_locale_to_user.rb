class AddLocaleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :locale, :string, default: 'ja'
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

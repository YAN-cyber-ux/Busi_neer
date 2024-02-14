class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string , index: { unique: true }
  end
end

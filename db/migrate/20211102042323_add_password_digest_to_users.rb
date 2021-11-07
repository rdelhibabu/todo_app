class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table(:users) do |t|
      t.string :password_digest
    end

      #add_column :users, :password_digest, :string
  end
end

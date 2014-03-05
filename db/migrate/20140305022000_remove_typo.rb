class RemoveTypo < ActiveRecord::Migration
  def up
    remove_column "admin_users", "salt"
    remove_column "admin_users", "passowrd_digest"
  end
  
  def down
     add_column "admin_users", "salt", :string, :limit => 40
     add_column "admin_users", "passowrd_digest", :string
  end
  
end

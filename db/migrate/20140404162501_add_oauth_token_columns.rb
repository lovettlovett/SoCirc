class AddOauthTokenColumns < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  		t.string :oauth_token
  		t.string :oauth_expires_at
  	end
  end
end

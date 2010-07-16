class AddWebsiteUrlToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :website_url, :string
  end

  def self.down
    remove_column :groups, :website_url
  end
end

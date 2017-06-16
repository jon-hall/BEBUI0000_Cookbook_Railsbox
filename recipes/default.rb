#
# Cookbook Name:: cookbook_railsbox
# Recipe:: default
#

include_recipe 'apt'
include_recipe "cookbook_railsbox::locale"
package "libsqlite3-dev"
include_recipe 'sqlite'
if node["cookbook_databox"]["databases"]["mysql"]
  include_recipe "cookbook_databox::mysql"
end
if node["cookbook_databox"]["databases"]["postgresql"]
  include_recipe "cookbook_databox::postgresql"
  include_recipe 'cookbook_railsbox::postpostgresql'
end
include_recipe 'cookbook_rackbox'
include_recipe 'imagemagick'
if node.attribute?(:new_relic)
  include_recipe "cookbook_railsbox::newrelic"
end

#
# Cookbook Name:: route53
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

# Install libxml "right now". By default it'll wait
# until after the recipe has run, which is too late
# to install chef_gem.
node.set['build_essential']['compiletime'] = true
include_recipe "build-essential"
package('libxml2-dev').run_action(:install)
package('libxslt1-dev').run_action(:install)

chef_gem "nokogiri" do
  action :install
  version "1.5.10"
end

chef_gem "fog" do
  action :install
end

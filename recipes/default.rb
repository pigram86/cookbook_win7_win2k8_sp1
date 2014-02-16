#
# Cookbook Name:: win7_w2k8_sp1
# Recipe:: default
#
# Copyright (C) 2014 Todd Pigram
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
batch node['sp1']['dir'] do
  code <<-EOH
  mkdir c:\\sp1
  EOH
  not_if {::File.exists?(node['sp1']['sleep'])}
  not_if {::File.exists?(node['sp1']['zip'])}
  not_if {reboot_pending?}
end

windows_zipfile node['sp1']['zip'] do
  source node['sp1']['url']
  action :unzip
  not_if {::File.exists?(node['sp1']['sleep'])}
  not_if {reboot_pending?}
end

batch node['sp1']['install'] do
  code <<-EOH
  C:\\SP1\\windows6.1-KB976932-X64.exe /quiet /norestart
  EOH
  not_if {reboot_pending?}
end

windows_reboot 60 do
  reason 'cause chef said so'
  only_if {reboot_pending?}
end

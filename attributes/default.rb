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
default['sp1']['url'] = "https://dl.dropboxusercontent.com/u/36379525/SP1.zip"
default['sp1']['dir'] = "make dir"
default['sp1']['install'] = "install"
default['sp1']['zip'] = "C:/SP1"
default['sp1']['sleep'] = "C:/sp1/sleep.exe"

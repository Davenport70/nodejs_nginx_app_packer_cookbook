#
# Cookbook:: nodejs_nginx
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nodejs_nginx::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    # let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should run apt-get update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    # installing
    # install Nginx
    it 'should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end
    # install nodejs_nginx
    it 'should install nodejs from recipe' do
      expect(chef_run).to include_recipe 'nodejs'
    end
    # services
    # start and enable
    it 'should enable nginx' do
      expect(chef_run).to enable_service 'nginx'
    end
    it 'should start nginx' do
      expect(chef_run).to start_service 'nginx'
    end
    # it 'should enable nodejs' do
    #   expect(chef_run).to enable_service 'nodejs'
    # end
    it 'should create a proxy.conf template in /etc/nginx/sites-available' do
      expect(chef_run).to create_template("/etc/nginx/sites-available/proxy.conf").with_variables(proxy_port: 3000)
    end
    it 'should create a symlink proxy.conf link in /etc/nginx/sites-enabled' do
      expect(chef_run).to create_link("/etc/nginx/sites-enabled/proxy.conf").with_link_type(:symbolic)
    end
    it 'should delete a proxy.conf link in /etc/nginx/sites-enabled' do
      expect(chef_run).to delete_link "/etc/nginx/sites-enabled/default"
    end
    it 'should install pm2 via npm' do
      expect(chef_run).to install_npm_package('pm2')
    end
    it 'should install react via npm' do
      expect(chef_run).to install_npm_package('react')
    end
  end
end

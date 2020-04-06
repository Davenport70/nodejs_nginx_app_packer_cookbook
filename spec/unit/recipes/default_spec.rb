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

    # installing
    # install Nginx
    it 'should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end
    # install nodejs_nginx
    it 'should install nodejs' do
      expect(chef_run).to install_package 'nodejs'
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
  end
end

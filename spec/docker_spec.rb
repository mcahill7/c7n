# frozen_string_literal: true

require 'docker'
require 'serverspec'

describe 'Dockerfile' do
  before(:all) do
    image = Docker::Image.build_from_dir('.')
    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe file('/policy.yml') do
    it { should be_file }
    it { should exist }
end

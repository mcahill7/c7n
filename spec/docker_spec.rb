# frozen_string_literal: true

require 'docker'
require 'serverspec'

describe 'Dockerfile' do
  before(:all) do
    image = Docker::Image.build_from_dir('.')
    set :os, family: :alpine
    set :backend, :docker
    set :docker_image, image.id
  end

  describe user('c7n') do
    it { should exist }
    it { should belong_to_group 'c7n' }
  end
end

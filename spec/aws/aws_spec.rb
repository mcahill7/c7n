# frozen_string_literal: true

require_relative '../spec_helper'

describe ecs_cluster('c7n-cluster') do
  it { should exist }
end

require 'spec_helper'

describe 'nothing' do

  before(:each) do
    puts 'hello, world!'
  end

  after(:each) do
    puts 'godbye, world!'
  end

  describe 'placeholder' do
    it 'runs' do
      puts 'wowee!'
    end
  end

end
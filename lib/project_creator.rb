#!/usr/bin/env ruby

require 'pry'
require 'fileutils'

p "Enter your project name:"
project = gets.chomp
FileUtils.mkdir("../#{project}")
FileUtils.cd("../#{project}")
FileUtils.mkdir("lib")
p "What do you want to name your file?"
file_name = gets.chomp
# local = "../#{project}"
FileUtils.touch("lib/#{file_name}.rb")
FileUtils.mkdir("spec")
FileUtils.touch("spec/#{file_name}_spec.rb")
FileUtils.touch("Gemfile")
File.open("Gemfile", 'w') { |file| file.write("source 'https://rubygems.org'

gem 'pry'
gem 'rspec'
gem 'fileutils'") }

File.open("lib/#{file_name}.rb", 'w') { |file| file.write("require 'pry'
require 'fileutils'
class Class_name
  def initialize()

  end
  def method

  end
end
")}

File.open("spec/#{file_name}_spec.rb", 'w') { |file| file.write("require 'pry'
require '#{file_name}.rb'

describe('#{file_name}') do
  it('this is your generic test') do

  end
end
")}

require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)

require 'scrap'


$:.unshift File.expand_path('./../lib/views', __FILE__)
require 'index'

puts Index.new.perform





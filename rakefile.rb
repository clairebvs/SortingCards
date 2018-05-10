# require “rake”
# require ‘rake/testtask’
require './test/round_test'
require './test/card_test'
require './test/deck_test'
require './test/guess_test'

task :default => :spec

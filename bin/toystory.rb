#!/usr/bin/ruby

require 'optparse'

options = {}
options[:file] = ''
OptionParser.new do |opts|
  opts.banner = "Usage: toystory.rb [-f FILEPATH]"

  opts.on('-f', '--file', "optional file containing a set of moves") do |file|
    options[:file] = ARGV[0]
    if File.exists?(options[:file])
      File.readlines(ARGV[0]).each do |line|
        p line
      end  
    else
      p 'Wrong file path. Are you sure it exists?'
      exit
    end
  end

  opts.on('-m', '--moves', "optional series of moves. Exemple: toystory.rb -m 'PLACE 0,0,NORTH LEFT REPORT'") do |file|
    options[:moves] = ARGV[0].split(' ')
  end
  
  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
  
end.parse!

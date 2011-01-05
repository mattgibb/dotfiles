require 'rubygems'
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

# prints the version used by irb
print "ruby version: ", `/usr/bin/env ruby --version`

# Loads .railsrc if using script/console
if ENV['RAILS_ENV'] 
  load File.dirname(__FILE__) + '/.railsrc' 
end 

# remembers command history
IRB.conf[:SAVE_HISTORY] = 50
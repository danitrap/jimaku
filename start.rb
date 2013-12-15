#!/usr/bin/env rubyw
require_relative 'app/jimaku'
require_relative 'app/messagebox'

begin
  $:.unshift File.dirname($0)
  jimaku = Jimaku.new(*ARGV)
  jimaku.rename!

rescue ArgumentError
  exe = File.basename(ENV["OCRA_EXECUTABLE"]) rescue $0
  message = "Usage:\nDrag and drop your video and subtitle files " +
            "on #{exe} to automagically rename your subtitle file."
  MessageBox.show(message, "Jimaku", :info)
  
rescue Exception => e
  message = "An error occured while running Jimaku:\n\n"
  message << "#{e.message} (#{e.class})"
  MessageBox.show(message, "Jimaku", :error)
end
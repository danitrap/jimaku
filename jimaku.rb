#!/usr/bin/env rubyw
begin
  $:.unshift File.dirname($0)

  exts = [".srt", ".ass", ".aqt", ".jss", ".sub", ".ttxt", ".pjs", 
          ".rt", ".gsub", ".gsup", ".ssa", ".usf", ".idx", ".stl"]

  ARGV.each_with_index do |arg,i|
    if (found = exts.index(File.extname(arg)))
      previous = ARGV[i == 0 ? 1 : 0]
      new_name = File.dirname(previous) + "/" + File.basename(previous, File.extname(previous))
      File.rename(arg, new_name + exts[found])
    end
  end
rescue Exception => e
  File.open("jimaku.log") do |f|
    f.puts e.inspect
    f.puts e.backtrace
  end
end
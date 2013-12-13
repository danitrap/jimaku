require_relative "exceptions"

class Jimaku

  EXTS = [".srt", ".ass", ".aqt", ".jss", ".sub", ".ttxt", ".pjs", 
          ".rt", ".gsub", ".gsup", ".ssa", ".usf", ".idx", ".stl"]

  def initialize(first_file, second_file)
    @files = [first_file, second_file]

    if @files.none? {|file| EXTS.include? File.extname(file)}
      raise NoSubFileGiven.new(@files, "No subtitles file given.")
    end
  end

  def rename!
    @files.each_with_index do |arg,i|
      if (found = EXTS.index(File.extname(arg)))
        previous = @files[i == 0 ? 1 : 0]
        new_name = File.dirname(previous) + "/" + File.basename(previous, File.extname(previous))
        File.rename(arg, new_name + EXTS[found])
      end
    end
  end
end
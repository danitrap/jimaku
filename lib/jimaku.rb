require_relative "exceptions"

class Jimaku
  ##
  # Given a video file and subtitles file it renames the subtitle file
  # to match its video counterpart.
  #
  # A NoSubFileGivenError is raised if no expected subtitles file is
  # passed to the constructor.

  EXTS = [".srt", ".ass", ".aqt", ".jss", ".sub", ".ttxt", ".pjs", 
          ".rt", ".gsub", ".gsup", ".ssa", ".usf", ".idx", ".stl"]


  def initialize(first_file, second_file)
    @pair = case
      when EXTS.include?( File.extname(first_file) )
        {video: second_file, subtitles: first_file}
      when EXTS.include?( File.extname(second_file) )
        {video: first_file, subtitles: second_file}
      else
        raise NoSubFileGivenError.new(self, "No subtitles file given.")
    end
  end

  def rename!
    new_name = File.dirname(@pair[:video]) + "/" + 
               File.basename(@pair[:video], File.extname(@pair[:video])) +
               File.extname(@pair[:subtitles])

    File.rename @pair[:subtitles], new_name
  end
end
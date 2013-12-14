require_relative '../lib/jimaku'
require 'securerandom'

EXTS = [".srt", ".ass", ".aqt", ".jss", ".sub", ".ttxt", ".pjs", 
        ".rt", ".gsub", ".gsup", ".ssa", ".usf", ".idx", ".stl"]

describe Jimaku do

	before :all do
		FileUtils.mkdir "./tmp"
	end
	
	before :each do
		ext = EXTS[rand(0..13)]
		@testing_files = ["./tmp/#{SecureRandom.hex}.mkv", "./tmp/#{SecureRandom.hex}#{ext}"]

		FileUtils.touch @testing_files
		@jimaku = Jimaku.new *@testing_files
	end

	after :all do
		FileUtils.rm_rf "./tmp"
	end

	describe "#new" do
		it "should be an instance of Jimaku" do
			@jimaku.should be_an_instance_of Jimaku
		end

		context "it should take the right amount of parameters" do
			it "should not accept only one parameter" do
				lambda {Jimaku.new "test.mkv"}.should raise_exception ArgumentError
			end
			it "should not accept three parameters" do
				three_params = lambda {Jimaku.new "test.mkv", "test.mkv", "test.mkv"}
				three_params.should raise_exception ArgumentError
			end
		end

		it "should raise an exception if no subtitle files are given" do
			lambda {Jimaku.new "test.mkv", "testing.mkv"}.should raise_exception NoSubFileGivenError
		end

		it "should work regardless of the order" do
			reversed = @testing_files.reverse
			Jimaku.new *reversed
		end

	end

	describe "#rename!" do
		it "should rename the correct file" do
			@jimaku.rename!
			video = @testing_files[0]
			previous_subtitles = @testing_files[1]
			File.exists?(video).should eql true
			File.exists?(previous_subtitles).should eql false
		end
	end

end
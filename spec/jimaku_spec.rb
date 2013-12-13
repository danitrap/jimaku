require_relative '../lib/jimaku'

describe Jimaku do

	before :each do
		@testing_files = ["./tmp/test.mkv", "./tmp/testing.srt"]

		FileUtils.mkdir "./tmp"
		FileUtils.touch @testing_files
		@jimaku = Jimaku.new *@testing_files
	end

	after :each do
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
	end

	describe "#rename!" do
		it "should rename the correct file" do
			@jimaku.rename!
			File.exists?("./tmp/test.srt").should eql true
			File.exists?("./tmp/test.mkv").should eql true
		end
	end

end
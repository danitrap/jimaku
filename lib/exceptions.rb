class NoSubFileGivenError < StandardError
  attr_accessor :object, :message
  def initialize(object, message)
    @object = object
    @message = message
  end
end
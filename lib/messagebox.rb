module MessageBox
  ##
  # A simple MessageBox helper.
  #
  # It only supports ERROR and INFO.

  ICON_ERROR = 0x00000010
  ICON_INFO = 0x00000040

  def self.show(message, title, icon)
    require 'Win32API'
    msg_icon = case icon
      when :error then ICON_ERROR
      when :info then ICON_INFO
      end
    message_box = Win32API.new("user32", "MessageBox", ['i','p','p','i'], 'i')
    message_box.call(0, message, title, msg_icon)
  end
end
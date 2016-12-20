module FakeSms
  Message = Struct.new(:number, :message )
  @message = []

  def self.send_sms(number: , message: )
    @message << Message.new(number,message)
  end

  def self.messages
    @message
  end
end
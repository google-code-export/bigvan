class Trace
  #this is a session class
  attr_accessor :trace
  @@MAX_LEN=10
  def initialize()
    @trace=[]
  end
  def add(url)
    @trace<<url
    if @trace.length()>@@MAX_LEN
      @trace.slice!(0,@trace.length()-@@MAX_LEN)
    end
  end
  
end

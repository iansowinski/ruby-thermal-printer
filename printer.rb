require 'rubyserial'
class Printer
  @@ESC = 27.chr
  def initialize (serial_port='/dev/ttyAMA0', baudrate=19200)
    @printer = Serial.new(serial_port, baudrate)
    # for initializing printer
    @printer.write(@@ESC)
    @printer.write(64.chr)
  end
  def write (args)
    @printer.write(args)
  end
  private
  def clear
  end
#  def no_name_function (heatTime=80, heatInterval=2, heatingDots=7)
#  don't know what to do with this. It's for setting up bitmapsk  
#    @printer.write(@@ESC)
#    @printer.write(55.chr)
#    @printer.write(heatingDots.chr)
#    @printer.write(heatTime.chr) 
#    @printer.write(heatInterval.chr)
#    printDensity = 15
#    printBreakTime = 15 
#    @printer.write(18.chr)
#    @printer.write(35.chr)
#    @printer.write(((printDensity << 4) | printBreakTime).chr)
end

printer = Printer.new
printer.write('Hello World')

require 'rubyserial'
class Printer
  attr_accessor
  @@ESC = 27.chr
  def initialize (serial_port='/dev/ttyAMA0', baudrate=19200, heatTime=80, heatInterval=2, heatingDots=7)
    @printer = Serial.new(serial_port, baudrate)
    # for initializing printer
    puts "printer initialized"
    @printer.write(@@ESC)
    @printer.write(64.chr)
    @printer.write(@@ESC)
    @printer.write(55.chr)
    @printer.write(heatingDots.chr)
    @printer.write(heatTime.chr) 
    @printer.write(heatInterval.chr)
    printDensity = 15
    printBreakTime = 15 
    @printer.write(18.chr)
    @printer.write(35.chr)
    @printer.write(((printDensity << 4) | printBreakTime).chr)
    puts "settings set"
  end
  def write (args)
    @printer.write(args)
    linefeed
    puts "writed"
  end
  # character mode settings
  def font_b (string)
    set_characters(0)
    @printer.write(string)
    clear
    linefeed
  end
  def clockwise_rotation(string)
    @printer.write("#{27.chr}V1")
    write(string)
    @printer.write("#{27.chr}V0")
  end
  def invert (string)
    @printer.write("#{29.chr}B1")
    write(string)
    @printer.write("#{29.chr}B0")
  end
  def upside_down (string)
    @printer.write("#{27.chr}{1")
    write(string)
    @printer.write("#{27.chr}{0")
  end
  def emphasize (string)
    @printer.write("#{27.chr}E1")
    write(string)
    @printer.write("#{27.chr}E0")
  end
  def double_height (string)
    set_characters(4)
    @printer.write(string)
    clear
    linefeed
  end
  def double_width (string)
    set_characters(5)
    @printer.write(string)
    clear
    linefeed
  end
  def deleteline (string)
    set_characters(6)
    @printer.write(string)
    clear
    linefeed
  end
  def linefeed
    @printer.write(10.chr)
  end
end

printer = Printer.new()
#printer.write("1234567")
#printer.write(1234)
#printer.font_b("abc")
printer.invert("abecadle")
printer.emphasize("abecadle")
printer.upside_down("abecadle")
printer.clockwise_rotation("abecadle")
printer.invert("abecadle")

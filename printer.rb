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
  # character mode settings
  def font_b (string)
    set_characters("1")
    @printer.write(string)
    clear
  end
  def invert (string)
    set_characters("2")
    @printer.write(string)
    clear
  end
  def upside_down (string)
    set_characters("4")
    @printer.write(string)
    clear
  end
  def emphasize (string)d
    set_characters("8")
    @printer.write(string)
    clear
  end
  def double_height (string)
    set_characters("16")
    @printer.write(string)
    clear
  end
  def double_width (string)
    set_characters("32")
    @printer.write(string)
    clear
  end
  def deleteline (string)
    set_characters("64")
    @printer.write(string)
    clear
  end
  private
  # function to clear character mode settings
  def clear
    @printer.write(@@ESC)
    @printer.write("!")
    @printer.write("0")
  end
  # function to set character mode
  def set_characters (mode)
#    case mode
#    when "font_b"
#      mode = "1"
#    when "invert"
#      mode = "2"
#    when "upside_down"
#      mode = "4"
#    when "emphasized"
#      mode = "8"
#    when "double_height"
#      mode = "16"
#    when "double_width"
#      mode = "32"
#    when "deleteline"
#      mode = "64"
#    end
    @printer.write(@@ESC)
    @printer.write("!")
    @printer.write(mode)
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

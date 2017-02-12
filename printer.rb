require 'rubyserial'

class Printer
    @@SerialPort = '/dev/ttyAMA0'
    @@BaudRate = 19200
    @@TimeOut = 3
    @@black_threshold = 48
    @@alpha_threshold = 127
    @@printer = nil
    @@ESC = 27.chr

    def initialize (heatTime=80, heatInterval=2, heatingDots=7, serialport=@@SerialPort)
          @printer = Serial.new(@@SerialPort, @@BaudRate)
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
    end
    def write (args)
      @printer.write(args)
    end

end

printer = Printer.new
printer.write('Hello World')

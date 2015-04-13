require "coreaudio"
require 'io/console'


dev = CoreAudio.default_output_device
buf_i1 = dev.output_loop(44000)
buf_i2 = dev.output_loop(44000)
buf_i3 = dev.output_loop(44000)

buf_j1 = dev.output_loop(44000)
buf_j2 = dev.output_loop(44000)
buf_j3 = dev.output_loop(44000)
buf_j4 = dev.output_loop(44000)

phase_i1 = Math::PI * 2.0 * 1209.0 / 44000.0
phase_i2 = Math::PI * 2.0 * 1336.0 / 44000.0
phase_i3 = Math::PI * 2.0 * 1477.0 / 44000.0

phase_j1 = Math::PI * 2.0 * 697.0 / 44000.0
phase_j2 = Math::PI * 2.0 * 770.0 / 44000.0
phase_j3 = Math::PI * 2.0 * 852.0 / 44000.0
phase_j4 = Math::PI * 2.0 * 941.0 / 44000.0


44000.times do |i|
  buf_i1[i] = ((0.4 * Math.sin(phase_i1*i)) * 0x7FFF).round
  buf_i2[i] = ((0.4 * Math.sin(phase_i2*i)) * 0x7FFF).round
  buf_i3[i] = ((0.4 * Math.sin(phase_i3*i)) * 0x7FFF).round
  
  buf_j1[i] = ((0.4 * Math.sin(phase_j1*i)) * 0x7FFF).round
  buf_j2[i] = ((0.4 * Math.sin(phase_j2*i)) * 0x7FFF).round
  buf_j3[i] = ((0.4 * Math.sin(phase_j3*i)) * 0x7FFF).round
  buf_j4[i] = ((0.4 * Math.sin(phase_j4*i)) * 0x7FFF).round
end


# Reads keypresses from the user including 2 and 3 escape character sequences.
def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!

  return input
end

def play_tone

end



until true==false
  c = read_char
  
  case c
  when "1"
    buf_i1.start
    buf_j1.start
    sleep 0.25
    buf_i1.stop
    buf_j1.stop   
  when "2" , "a" , "b" , "c"
    buf_i2.start
    buf_j1.start
    sleep 0.25
    buf_i2.stop
    buf_j1.stop
  when "3" , "d" , "e" , "f"
    buf_i3.start
    buf_j1.start
    sleep 0.25
    buf_i3.stop
    buf_j1.stop
    
  when "4" , "g" , "h" , "i"
    buf_i1.start
    buf_j2.start
    sleep 0.25
    buf_i1.stop
    buf_j2.stop   
  when "5" , "j" , "k" , "l"
    buf_i2.start
    buf_j2.start
    sleep 0.25
    buf_i2.stop
    buf_j2.stop
  when "6" , "m" , "n", "o"
    buf_i3.start
    buf_j2.start
    sleep 0.25
    buf_i3.stop
    buf_j2.stop
    
  when "7" , "p" , "q" , "r" , "s"
    buf_i1.start
    buf_j3.start
    sleep 0.25
    buf_i1.stop
    buf_j3.stop   
  when "8" , "t" , "u" , "v"
    buf_i2.start
    buf_j3.start
    sleep 0.25
    buf_i2.stop
    buf_j3.stop
  when "9" , "w" , "x" , "y" , "z"
    buf_i3.start
    buf_j3.start
    sleep 0.25
    buf_i3.stop
    buf_j3.stop

  when "*"
    buf_i1.start
    buf_j4.start
    sleep 0.25
    buf_i1.stop
    buf_j4.stop   
  when "0"
    buf_i2.start
    buf_j4.start
    sleep 0.25
    buf_i2.stop
    buf_j4.stop
  when "#"
    buf_i3.start
    buf_j4.start
    sleep 0.25
    buf_i3.stop
    buf_j4.stop
  when "\u0003"
    exit 0
  when "\e"
    exit 0
  end
end    
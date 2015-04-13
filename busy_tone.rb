require "coreaudio"

dev = CoreAudio.default_output_device
buf = dev.output_loop(44000)
buf2 = dev.output_loop(44000)

phase = Math::PI * 2.0 * 480.0 / 44000.0
phase2 = Math::PI * 2.0 * 620.0 / 44000.0

44000.times do |i|
  buf[i] = ((0.4 * Math.sin(phase*i)) * 0x7FFF).round
  buf2[i] = ((0.4 * Math.sin(phase2*i)) * 0x7FFF).round
end





until true==false
    buf.start
    buf2.start
    sleep 0.5
    buf.stop
    buf2.stop
    sleep 0.5
end    
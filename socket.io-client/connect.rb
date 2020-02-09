require 'socket.io-client-simple'

socket = SocketIO::Client::Simple.connect "http://#{ENV["URL"]}:#{ENV["PORT"]}"

socket.on :connect do
  socket.emit :psubscribe, ENV["CHANNEL"]
  puts "connect!!!"
end

socket.on :disconnect do
  puts "disconnected!!"
end

socket.on :error do |err|
  p err
end

loop do
  msg = STDIN.gets.strip
  next if msg.empty?
end
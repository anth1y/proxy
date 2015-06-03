require 'socket'
class Httpclient
HTTP_HEADER = <<HEADERS
GET / HTTP/1.0
User-Agent: Irona
 

HEADERS
	def initialize
		@hostname = 'www.google.com' 
		@port = 80
	end

	def fetch(&action)
		s = TCPSocket.new(@hostname, @port)
		s.puts Httpclient::HTTP_HEADER
		while line = s.gets 
			action.call(line.chomp)
		end
		s.close
	end
end





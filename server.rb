#!/usr/bin/env ruby
require 'open-uri'
require 'socket'
require './client.rb'

server = TCPServer.new 'localhost', 80
loop do
  client = server.accept
	target = Httpclient.new
	target.fetch do |line|
	client.puts line
	end
  client.close
end

require 'socket'

def parse_request(request_line)
  http_method, path_and_params, version = request_line.split(' ')
  path, params = path_and_params.split('?')
  params = params.split('&').each_with_object({}) do |pair, hash|
    pair = pair.split('=')
    hash[pair[0]] = pair[1]
  end 
  [http_method, path, params, version]
end 

server = TCPServer.new("localhost", 3003)
loop do 
  client = server.accept 

  request_line = client.gets 
  next if !request_line || request_line =~ /favicon/
  http_method, path, params, version = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts 
  client.puts "<!DOCTYPE html>"
  client.puts "<html>"
  client.puts "<body>"

  client.puts "<pre>"
  client.puts http_method
  client.puts path 
  client.puts params
  client.puts version
  client.puts "</pre>"

  client.puts "<h1>Welcome to dice!</h1>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do 
    client.puts "<p>", rand(1..sides), "</p>"
  end 

  client.puts "</body>"
  client.puts "</html>"

  client.close 
end 
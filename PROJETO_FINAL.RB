require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url = URI("https://translo.p.rapidapi.com/api/v3/translate")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/x-www-form-urlencoded'
request["X-RapidAPI-Key"] = '96411c1a9cmsh498e0c5598480aep1655bbjsn38e94879c992'
request["X-RapidAPI-Host"] = 'translo.p.rapidapi.com'

puts "Insert text to be translated here: "
translation = gets.chomp

request.body = "from=pt-BR&to=en&text=#{translation}"

response = http.request(request)
#puts response.read_body
string = response.read_body
parsed = JSON.parse(string)

puts parsed["translated_text"]
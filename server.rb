require 'sinatra'
require 'nokogiri'
require 'httparty'

get '/'do
p params[:job]
# posts security jobs
url = "https://miami.craigslist.org/search/#{params[:job]}"
response = HTTParty.get url

dom = Nokogiri::HTML(response.body)


info = dom.css('.content').css('.result-row').css('.hdrlnk').map do |a|
  "<p>#{a.text}</p>"

end




end



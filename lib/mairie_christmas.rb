require 'nokogiri'
require 'open-uri'
  
url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/index.html"))
#URI(url).open(**options)

#puts url

#get_townhall_email(townhall_url)

email = url.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]]'.each do |email|

print email


require 'nokogiri'
require 'open-uri'
  
url = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))
#URI(url).open(**options)

array_names = []
array_prices = []

url.xpath('//*[@class="cmc-table__column-name sc-1kxikfi-0 eTVhdN"]').each do |crypto_names|
  array_names << crypto_names.text
end

url.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |crypto_prices|
  array_prices << crypto_prices.text.delete_prefix('$').gsub(',','').to_f
end

fusion = [{}]

for x in 0..(array_prices.length-1)
  
fusion[x] = {array_names[x] => array_prices[x]}
end
puts fusion




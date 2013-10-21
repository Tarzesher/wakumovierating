require 'rubygems'
require 'nokogiri'
require 'open-uri'



puts search_imdb("iron man")

def search_imdb(keyword)

#open the search page
keyword = keyword.sub!(" ", "+")
search_imdb_url = "http://www.imdb.com/find?q="+keyword
imdb_search = Nokogiri::HTML(open(search_imdb_url))
keyword_link = imdb_search.at_css('td.result_text').at_css('a').map.to_s

#open search page results
imdb_url = keyword_link
imdb = Nokogiri::HTML(open(imdb_url))
imdb_rating = imdb.at_css('div.titlePageSprite').text.strip.to_f

return imdb_rating

end

def search_rotten_tomato(keyword)

#open the search page
keyword = keyword.sub!(" ", "_")
search_imdb_url = "http://www.rottentomatoes.com/m/"+keyword
imdb_search = Nokogiri::HTML(open(search_imdb_url))
keyword_link = imdb_search.at_css('td.result_text').at_css('a').map.to_s


#http://www.rottentomatoes.com/m/iron_man
rotten_tomato_url = "C:\\Sites\\WakuMovieRatings\\Movies Resources\\Kill Bill  Volume 1 - Rotten Tomatoes.htm"
rotten_tomato = Nokogiri::HTML(open(rotten_tomato_url))
rotten_tomato_rating = rotten_tomato.at_css('span.meter').text.strip.to_f
rotten_tomato_synopsis = rotten_tomato.at_css('#movieSynopsis').text.strip
rotten_tomato_link = rotten_tomato.at_css('#movieSynopsis').at_css('a')
puts rotten_tomato_rating
#puts rotten_tomato_synopsis
puts rotten_tomato_link

end


def search_meta_critic(keyword)
#http://www.metacritic.com/search/all/iron+man/results
meta_critic_url = "C:\\Sites\\WakuMovieRatings\\Movies Resources\\kill bill - Reviews, Articles, People, Trailers and more at Metacritic - Metacritic.htm"
meta_critic = Nokogiri::HTML(open(meta_critic_url ))
meta_critic_rating = meta_critic.at_css('span.textscore_favorable').text.strip.to_f

puts meta_critic_rating


results  = (imdb_rating + rotten_tomato_rating + meta_critic_rating / 3).to_f

puts "Waku Rating #{results}"

end



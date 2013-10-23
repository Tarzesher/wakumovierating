module MashupHelper

require 'nokogiri'
require 'open-uri'

def search_movie(search_keyword)
	  
		#rating_imdb = search_imdb(search_keyword)
		#rating_rotten_tomato = search_rotten_tomato(search_keyword)
		#rating_meta_critic = search_meta_critic(search_keyword)
		
		#results = rating_imdb + rating_rotten_tomato + rating_meta_critic / 3).to_f
		#results  = rating_meta_critic
		#return results
	  end
	  
	def search_imdb(search_keyword)
		#open the search page
		search_keyword = search_keyword.sub!(" ", "+")
		search_imdb_url = "http://www.imdb.com/find?q="+search_keyword+"&s=all"
		imdb_search = Nokogiri::HTML(open(search_imdb_url))
		#open the search page results
		imdb_url = "http://www.imdb.com" + imdb_search.xpath('//td[@class="result_text"]/a/@href').first.value
		imdb = Nokogiri::HTML(open(imdb_url))
		imdb_rating = imdb.at_css('div.titlePageSprite').text.strip.to_f

		return imdb_rating

	end

	def search_rotten_tomato(search_keyword)
		#open the search page
		search_keyword = search_keyword.sub!(" ", "_")
		rotten_tomato_url = "http://www.rottentomatoes.com/m/"+search_keyword
		rotten_tomato = Nokogiri::HTML(open(rotten_tomato_url))
		rotten_tomato_rating = rotten_tomato.at_css('span.meter').text.strip.to_f / 10
		
		return rotten_tomato_rating

	end

	def search_meta_critic(search_keyword)
		#open the search page
		search_keyword = search_keyword.sub!(" ", "+")
		meta_critic_url = "http://www.metacritic.com/search/all/"+search_keyword+"/results"
		meta_critic = Nokogiri::HTML(open(meta_critic_url ))
		meta_critic_rating = meta_critic.at_css('span.textscore_mixed').text.strip.to_f
		return meta_critic_rating
	end


end
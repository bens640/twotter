class Twott < ActiveRecord::Base
attr_accessor :tweet, :tweeter, :gif, :ferp


@config = {api_key: "f7c390ae571e2ec89822e13aae49223e"}
@client = Twitter::Streaming::Client.new do |config|
	config.consumer_key        = "dMbxE2fLs4eTy00KjsdKrZUN5"
	config.consumer_secret     = "DVvlt8VPtyjmgMoeGPt1yB8R50JNDvSSnjMk1ZrO5mEjbqRMuy"
	config.access_token        = "3268181360-ZGVBIoBHwdLWWnye9s1xoPLdpRQGOyWPqXf7r1Q"
	config.access_token_secret = "sBtuKb5sRHgt0ISfbjOzpOU1VsN76QgqGKgCSoxzgbloR"
end
def initialize




	response = HTTParty.get('http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC')
	@gif = response['data']['image_url']


end

def twitter

	response1 = HTTParty.get("https://twitter.com/davidshukmanbbc")
	dom1 = Nokogiri::HTML(response1.body)
	tweets = dom1.xpath("//*[@id='bd']/div[2]/div[1]/div[2]/div[2]/div")
	tweeter = dom1.xpath("//*[@id='bd']/div[2]/div[1]/div[2]/div[1]/span/span")


	@tweeter = tweeter.text.to_s
	@tweet = tweets.text.to_s

	# @client.sample do |object|
	#
	# 	if object.is_a?(Twitter::Tweet)
	# 		@derp = object.text
	# 		if Indico.language(@derp, @config)['English'] > 0.05
	# 			@ferp = object.user.id.to_s
	#
	# 			break
	# 		end
	# 	end


# end
end
	end


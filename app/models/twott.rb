class Twott < ActiveRecord::Base
attr_accessor :tweet, :tweeter, :gif, :ferp

def configTwitter
	@client = Twitter::Streaming::Client.new do |config|
		config.consumer_key        = "dMbxE2fLs4eTy00KjsdKrZUN5"
		config.consumer_secret     = "DVvlt8VPtyjmgMoeGPt1yB8R50JNDvSSnjMk1ZrO5mEjbqRMuy"
		config.access_token        = "3268181360-ZGVBIoBHwdLWWnye9s1xoPLdpRQGOyWPqXf7r1Q"
		config.access_token_secret = "sBtuKb5sRHgt0ISfbjOzpOU1VsN76QgqGKgCSoxzgbloR"
	end
end

def initialize
	response = HTTParty.get('http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC')
	@gif = response['data']['image_url']
	configTwitter
end



def twitter
	@config = {api_key: "f7c390ae571e2ec89822e13aae49223e"}
	@client.sample do |object|

		if object.is_a?(Twitter::Tweet)
			@derp = object.text
			if Indico.language(@derp, @config)['English'] > 0.05
				@ferp = object.user.id.to_s
				break
			end
		end
	end

	response1 = HTTParty.get("https://twitter.com/intent/user?user_id=#{@ferp}")
	dom1 = Nokogiri::HTML(response1.body)
	twoot = dom1.xpath("//*[@id='bd']/div[2]/div[1]/div[2]/div[2]/div")
	twooter = dom1.xpath("//*[@id='bd']/div[2]/div[1]/div[2]/div[1]/span/span")
	twooter = twooter.text

	@tweeter = twooter
	@tweet = twoot.text

	end

end

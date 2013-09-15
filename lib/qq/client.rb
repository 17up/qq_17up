require "rest-client"

module Qq
	class Client
		attr_reader :oauth

		def initialize(access_token, uid)
			@oauth = Oauth.new(access_token,uid)
		end

		################# api

		def get_info(options = {})
			@oauth.get "user/get_info",options
		end

		#发表一条微博信息到腾讯微博
		def add_t(content,options = {})
			default_params = { :content => content }
			@oauth.post "t/add_t",default_params.merge(options)
		end

		#上传图片并发表消息到腾讯微博
		def add_pic_t(content,pic,options = {})
			default_params = { :content => content,:pic => pic }
			@oauth.post "t/add_pic_t",default_params.merge(options)
		end

		def add_blog(title,content)
			params = { :content => content,:title => title,:format => 'json' }
			@oauth.post "blog/add_one_blog",params
		end

	end
end

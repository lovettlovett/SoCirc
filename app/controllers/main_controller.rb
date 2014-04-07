class MainController < ApplicationController
	def index
		@user = User.find_by(id: 1)
		# @token = @user.oauth_token
		@token = "CAAJ7jL2bet0BAN13289t02hDoiaoi5CfYZC61t9DZA4nzh0hMEU3Xb3Y466dgqtrqVHsn2GbmOQ59vlTFlOiGt1prcXJ3ZCJE18ggZCKbGoTpLSnB2HwOWugIPLfgYFRblxXvDZA0miwO2FYfI2zSSdnzi8Sk1uQkyWuzU8s55ehmhiy7O9xGQKiPTeUmLhUZD"
		@from_facebook = HTTParty.get("https://graph.facebook.com/me/friends?access_token=#{@token}")

		@facebook_friends_json = JSON.parse(@from_facebook)

		@facebook_friend_ids = @facebook_friends_json["data"].map do |friend|
			friend["id"]
		end

		@first_100_ids = @facebook_friend_ids.first(100)

		#to find each of your facebook friends' profile pictures
		# @facebook_friends_pics = @first_100_ids.map do |id|

		# 	@profile_pic_data = HTTParty.get("https://graph.facebook.com/#{id}?fields=id%2Cname%2Cpicture&access_token=#{@token}")

		# 	@profile_pic_json = JSON.parse(@profile_pic_data)

		# 	@profile_pic = @profile_pic_json["picture"]["data"]["url"]
		# end

		#to find education info for your facebook friends
		@facebook_education_info = HTTParty.get("https://graph.facebook.com/me/friends?fields=education&access_token=#{@token}")

		@facebook_education = JSON.parse(@facebook_education_info)

		@schools = []

		@facebook_education["data"].each do |education|

			if education.has_key?("education")
				x = 0
				while x < education["education"].size
				@schools.push(education["education"][x]["school"]["name"])
				# binding.pry
				x = x + 1
				end
			end
		end

		@school_frequencies = @schools.each_with_object(Hash.new(0)){ |m, h| h[m] += 1}.sort_by{|k, v| v}

		@first_ten = @school_frequencies.reverse.first(10)
		# binding.pry

		#relationship status section
		@facebook_relationship_info = HTTParty.get("https://graph.facebook.com/me/friends?fields=relationship_status&access_token=#{@token}")

		@facebook_relationship = JSON.parse(@facebook_relationship_info)

		@single_count = 0
		@relationship_statuses = []

		@facebook_relationship["data"].each do |relationship|

			if relationship.has_key?("relationship_status")
				@relationship_statuses.push(relationship["relationship_status"])
			else 
				@single_count = @single_count + 1
			end
		end	

		@relationship_frequencies = @relationship_statuses.each_with_object(Hash.new(0)){ |m, h| h[m] += 1}.sort_by{|k, v| v}


		#location section
		@facebook_location_info = HTTParty.get("https://graph.facebook.com/me/friends?fields=location&access_token=#{@token}")

		@facebook_location = JSON.parse(@facebook_location_info)

		@facebook_locations = []

		@facebook_location["data"].each do |location|
			if location.has_key?("location")
				@facebook_locations.push(location["location"]["name"])
			end
		end

		@location_frequencies = @facebook_locations.each_with_object(Hash.new(0)){|m, h| h[m] += 1}.sort_by{|k, v| v}
		
		binding.pry
	end

end
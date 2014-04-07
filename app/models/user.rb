class User < ActiveRecord::Base
	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	    user.oauth_token = auth["credentials"]["token"]
	    user.oauth_expires_at = auth["credentials"]["expires_at"]
	  end
	end
end

# !ruby/hash:OmniAuth::AuthHash provider: facebook uid: '1547880003' info: !ruby/hash:OmniAuth::AuthHash::InfoHash nickname: julia.m.lovett email: jml229@georgetown.edu name: Julia Lovett first_name: Julia last_name: Lovett image: http://graph.facebook.com/1547880003/picture?type=square urls: !ruby/hash:OmniAuth::AuthHash Facebook: https://www.facebook.com/julia.m.lovett verified: true credentials: !ruby/hash:OmniAuth::AuthHash token: CAAJ7jL2bet0BAOy6eZAF3IhETF2jK7jx3RW7iIA1zBzRT7icV3dmkYZA599DhtbqmvIaVn5aAQ1o9JSAYsbk88YvyIEecXHFoyicAVqgPseq61i4Xwy0gZB1rtsHHvkoyNxRSljmGPyQysfZAVJiQ4DMq084sIYt6mrml8Q9YehDk3B943GW expires_at: 1401807826 expires: true extra: !ruby/hash:OmniAuth::AuthHash raw_info: !ruby/hash:OmniAuth::AuthHash id: '1547880003' email: jml229@georgetown.edu first_name: Julia gender: female last_name: Lovett link: https://www.facebook.com/julia.m.lovett locale: en_US name: Julia Lovett timezone: -4 updated_time: '2014-02-16T19:07:29+0000' username: julia.m.lovett verified: true
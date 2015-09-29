class User

  def initialize(username)
    @username = username
    @response = get_response
  end

  def profile_picture
    @response["avatar_url"]
  end

  def name
    @response["name"]
  end

  def username
    @response["login"]
  end

  def work
    @response["company"]
  end

  def location
    @response["location"]
  end

  def joined_on
    @response["created_at"]
  end

  def followers
    @response["followers"]
  end

  def starred
    @response["https://api.github.com/users/#{@username}/starred{/owner}{/repo}"]
  end

  def following
    @response["following"]
  end

  def organizations
    @response["organizations_url"]
  end

private

def get_response
  key=ENV['GITHUB_CLIENT_ID']
  response=HTTParty.get("https://api.github.com/users/#{@username}", headers: {
    "GITHUB_USERNAME" => "#{key}",
    "User-Agent" => "GITHUB_USERNAME"
  })
  #JSON.parse(response.to_s)
end


end

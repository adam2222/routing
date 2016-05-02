require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html?name=peter'
# ).to_s

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html?name=peter'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { user: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
    )
  rescue
    puts "We have reached the rescue block."
    retry
  end

end

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3'
  ).to_s

  # begin
    puts RestClient.get(
      url,
      params: { user: { id: 3, name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
    )
  # rescue
  # #   puts "We have reached the rescue block."
  #   return
  # end
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3'
  ).to_s

  puts RestClient.patch(
    url,
    { user: { name: "Bizmo", email: "bizmo@bizmo.bizmo" } }
  )
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3'
  ).to_s

  puts RestClient.delete(
    url
    
  )
end


if __FILE__ == $PROGRAM_NAME
  destroy_user
end

require_relative 'item'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
  	  item_name = req.path.split("/item/").last 
  	  item = @@items.find{|s| s.title == song_title}
      resp.write song.artist
    end
  	 
    resp.finish
    end
end

require_relative 'item'
class Application
  
@@songs << 

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/songs/)
  	  item_name = req.path.split("/item/").last 
  	  item = @@songs.find{|s| s.title == song_title}
      resp.write song.artist
    end
  	 
    resp.finish
    end
end

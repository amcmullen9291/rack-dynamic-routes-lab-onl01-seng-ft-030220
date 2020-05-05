require_relative 'item'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
  	  item_name = req.path.split("/item/").last 
  	  item = @@items.find{|s| s.name == item_name}
      resp.write item_name.name
    end
  	 
    resp.finish
    end
end

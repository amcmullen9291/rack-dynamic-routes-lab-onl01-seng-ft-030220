require_relative 'item'
class Application < Item
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
  	  item_name = req.path.split("/item/").last 
  	  @@item.find{|s| s.name == item_name}
  	  resp.write item.name 
      resp.write item.price
      resp.status = 200
    elsif @@item.excelude?(item_name)
      resp.status = 400
      resp.write" Item not found"
    else
      resp.status = 404
    end 
    resp.finish
  end
end

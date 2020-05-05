require_relative 'item'
class Application
  @@search = []
  
  def initialize 
    @@search << Item.all
  end 
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.include?(/items/)
  	  item_name = req.path.split("/item/").last 
  	  item = @@search.find{|s| s.name == item_name}
  	  if item 
        resp.write item.price
        resp.status = 200
      else
        resp.status = 400
        resp.write" Item not found"
      end
    else
      resp.status = 404
    end 
    resp.finish
  end
end


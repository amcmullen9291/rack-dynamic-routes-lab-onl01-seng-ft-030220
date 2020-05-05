require_relative 'item'
class Application
  @@search = []
  
  def initialize 
    @@search << Item.all
  end 
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.include?("/items/")
  	  item_name = req.path.split("/item/").last 
  	   @@search.find do |food| 
  	    if food.name == item_name
          resp.write food.price
          resp.status = 200
        else
          resp.status = 400
          resp.write" Item not found"
        end
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end 
    resp.finish
  end
end


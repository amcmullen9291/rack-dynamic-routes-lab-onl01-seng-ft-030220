class Application
def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.include?("/items/")
      item_name = req.path.split("/items/").last
      item = @@items.find { |i| i.name == item_name }
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
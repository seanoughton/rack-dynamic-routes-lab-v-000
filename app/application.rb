class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item =@@items.find{|i| i.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status=404
      resp.write "Route not found"
    end
    resp.finish
  end
=begin
    if req.path=="/testing"
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find do |item|
        item.name == item_name
      end
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    end
    resp.finish
  end
=end

end

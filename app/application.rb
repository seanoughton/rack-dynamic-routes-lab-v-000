class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/testing"
    end
=begin
    if req.path.match =="/items/"
      item_name = req.path.split("/items/").last
      item = @@items.find do |item|
        item.name == item_name
      end
      resp.write item.price
    else
      resp.write "Route not found"
      #resp.status = 404
    end
=end
    resp.finish
  end

end

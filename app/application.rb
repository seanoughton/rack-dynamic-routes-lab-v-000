class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/testing"
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/songs/)
      item_name = req.path.split("/items/").last
      item = @@items.find do |item|
        item.name == item_name
      end
      resp.write item.price
      resp.status = 200
    end
=begin
    if req.path.match =="/items/"
      item_name = req.path.split("/items/").last
      item = @@items.find do |item|
        item.name == item_name
      end
      resp.write item.price
    end
=end
    resp.finish
  end

end

class Application

  @@items = [Item.new("candy",0.24), Item.new("popcorn", 3.50), Item.new("Seltzer", 2.00)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
        if item
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400 
        end
    end

    resp.finish
   


  end

end


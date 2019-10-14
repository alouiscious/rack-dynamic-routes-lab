require 'pry'

class Application
  # @@items = [Item.new(name, price)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path=="/items"
      item.name = req.path(/items/).last
      binding.pry
        
      if item = @@items.find {|i| i.name == item_name}
            resp.write item.price
            # resp.write "Your items are #{item.name}"
            # resp.status = 200
            
      else
        resp.status = 400 
        resp.write "Item not found "
      end
    else
      resp.status = 404 
      resp.write "Route not found"
    end
    resp.finish
  end
end

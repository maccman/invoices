Clients  = require("controllers/clients")
Products = require("controllers/products")

Client = require("models/client")
Product = require("models/product")

class App extends Spine.Controller
  elements:
    "#clients": "clients"
    "#products": "products"
  
  constructor: ->
    super
    
    @clients  = new Clients(el: @clients)
    @products = new Products(el: @products)
    
    new Spine.Manager(@clients, @products)
    
    @routes
      "/clients": -> @clients.active()
      "/products/:id": (params) ->
        @products.change Client.find(params.id)
        @products.active()

    Spine.Route.setup(shim: true)
    @navigate "/clients"
        
    Client.create(name: "Client 1")
    Client.create(name: "Client 2")
    Client.create(name: "Client 3")
    Client.create(name: "Client 4")
    Client.create(name: "Client 5")
    
    Product.create(name: "Product 1")
    Product.create(name: "Product 2")
    Product.create(name: "Product 3")
    Product.create(name: "Product 4")
    Product.create(name: "Product 5")
    
module.exports = App
Clients  = require("controllers/clients")
Products = require("controllers/products")
Invoices = require("controllers/invoices")

Client = require("models/client")
Product = require("models/product")
Invoice = require("models/invoice")

class App extends Spine.Controller
  elements:
    "#clients": "clients"
    "#products": "products"
    "#invoices": "invoices"
  
  constructor: ->
    super
    
    @clients  = new Clients(el: @clients)
    @products = new Products(el: @products)
    @invoices = new Invoices(el: @invoices)
    
    new Spine.Manager(@clients, @products, @invoices)
    
    @routes
      "/clients": -> @clients.active()
      "/products/:id": (params) ->
        @products.change Client.find(params.id)
        @products.active()
      "/invoices/:id": (params) ->
        @invoices.change Invoice.find(params.id)
        @invoices.active()

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
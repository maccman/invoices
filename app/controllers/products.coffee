$ = jQuery

Product = require("models/product")
Invoice = require("models/invoice")

class Products extends Spine.Controller
  elements:
    ".items": "items"
    ".status": "status"
    ".filter": "filter"
  
  events:
    "click .add": "add"
    "click .create": "create"
    "keyup .filter": "filter"
  
  constructor: ->
    super
    @products = []
    Product.bind("refresh change", @render)
  
  render: =>
    query    = @filter.val()
    products = Product.filter(query)
    
    # Make sure products aren't in array
    products = products.filter (p) => 
                @products.every (pp) -> 
                  not pp.eql(p)

    @items.html require("views/products/list")(products)
    
    data = {count: @products.length}
    @status.html require("views/products/status")(data)

  change: (client) ->
    @client = client
    @products = []
    @render()
    
  add: (e) ->
    item = $(e.target).item()
    @products.push(item)
    @render()
    
  filter: (e) ->
    # if key is enter
    if e.keyCode is 13 
      @items.find(".item:first .add").click()  

    @render()
    
  create: ->
    invoice = Invoice.create()
    invoice.addProducts(@products)
    @navigate("/invoices", invoice.id)
    
module.exports = Products
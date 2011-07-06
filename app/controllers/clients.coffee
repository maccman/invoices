Client = require("models/client")

class Clients extends Spine.Controller
  events: 
    "click .item": "click"
  
  constructor: ->
    super
    Client.bind("refresh change", @render)
    
  render: =>
    clients = Client.all()
    @html require("views/clients/list")(clients)
    
  click: (e) ->
    item = $(e.target).item()
    @navigate("/products", item.id)
  
module.exports = Clients
class Item extends Spine.Model

class Invoice extends Spine.Model
  @configure "Invoice", "products"
  
  @belongs "client", "models/client"
  @many "invoice_items", "models/invoice_item"
  
  addProducts: (products) ->
    @invoice_items.create(product: product) for product in products
  
module.exports = Invoice
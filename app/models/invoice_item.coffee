class InvoiceItem extends Spine.Model
  quantity: 1
  
  @configure "InvoiceItem", "quantity"
  
  @belongs "invoice", "models/invoice"
  @belongs "product", "models/product"
  
module.exports = InvoiceItem
class Invoices extends Spine.Controller
  render: ->
    # TODO!
    console.log(@invoice)
    console.log(@invoice.invoice_items.all())
  
  change: (invoice) ->
    @invoice = invoice
    @render()
    
module.exports = Invoices
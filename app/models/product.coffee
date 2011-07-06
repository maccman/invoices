class Product extends Spine.Model
  @configure "Product", "name"
  
  @filter: (query) ->
    return @all() unless query
    
    query = query.toLowerCase()
    @select (product) -> product.filter(query)
      
  filter: (query) ->
    @name.toLowerCase().indexOf(query) > -1
  
module.exports = Product
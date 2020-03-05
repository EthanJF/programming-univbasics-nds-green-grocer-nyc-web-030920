def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
  while i < collection.length do
    if collection[i][:item] === name
      return collection[i]
    end
    i += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  i = 0
  
  result = []
  
  while i < cart.length do
    find_item_by_name_in_collection(cart[i][:item], result) ? 
    find_item_by_name_in_collection(cart[i][:item], result)[:count] += 1 :
    result << {
      :item => cart[i][:item],
      :price => cart[i][:price],
      :clearance => cart[i][:clearance],
      :count => 1
      }
     i += 1
    end
    
    result

end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
  
  while i < coupons.length do
    this_item_hash = find_item_by_name_in_collection(coupons[i][:item],cart)
    
    this_item_hash[:count] > coupons[i][:num] ?
    this_item_hash[:count] -= coupons[i][:num] :
    cart.delete_at(cart.index(this_item_hash)) 
    
    cart << {
      :item => "#{this_item_hash[:item]} W/COUPON",
      :price => coupons[i][:cost] / coupons[i][:num],
      :clearance => this_item_hash[:clearance],
      :count => coupons[i][:num]
    }
    
    i += 1
    
  end
  
  cart
    
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

coupons = 

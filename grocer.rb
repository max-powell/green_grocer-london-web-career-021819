require "pry"

def consolidate_cart(cart)
  new_cart = {}
  cart.each do |hash|
    hash.each do |item, details|
      if new_cart.keys.include?(item)
        new_cart[item][:count] += 1
      else
      new_cart[item] = details
      new_cart[item][:count] = 1
      end
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  binding.pry
  # add coupon
  coupons.each do |coupon|
    cart["#{coupon[:item]} W/COUPON"] = {
      price: coupon[:cost],
      clearance: cart[coupon[:item]][:clearance]
    }
  end
  # remove coupned item
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

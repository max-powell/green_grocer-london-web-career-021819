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
  coupons.each do |coupon|
    if cart.keys.include?("#{coupon[:item]} W/COUPON")
      cart["#{coupon[:item]} W/COUPON"][:count] += 1
      cart[coupon[:item]][:count] -= coupon[:num]
    else
      if cart.keys.include?(coupon[:item])
        cart["#{coupon[:item]} W/COUPON"] = {
          price: coupon[:cost],
          clearance: cart[coupon[:item]][:clearance],
          count: 1
        }
      cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance]
      details[:price] = (details[:price] * 0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  apply_coupons(new_cart, coupons)
  apply clearance(new_cart)
end

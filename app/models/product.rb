class Product
 attr_accessor :pid, :item, :description, :price, :condition, :dimension_w,
               :dimension_l, :dimension_h, :img_file, :quantity, :category

   def discount
    if self.condition == "good"
      discount = self.price.to_i * 0.9
    elsif self.condition == "average"
       discount = self.price.to_i * 0.8
    else
       discount = self.price.to_i * 1.0
    end
    discount.to_i
  end

end

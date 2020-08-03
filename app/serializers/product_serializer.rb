class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :slug, :cost_price

  attributes :variant_images do |product|
    product.variant_images.map{ |img| img.image.carousel.url }
  end
end

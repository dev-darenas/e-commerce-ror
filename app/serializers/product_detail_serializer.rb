class ProductDetailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :slug, :cost_price

  attributes :variant_images do |product|
    product.variant_images.map{ |img| img.image.large.url }
  end

  attributes :carousel do |product|
    product.variant_images.map{ |img| { alt: img.alt, img: img.image.carousel.url} }
  end

  attributes :whatsapp do |product|
    product.store.whatsapp
  end
end

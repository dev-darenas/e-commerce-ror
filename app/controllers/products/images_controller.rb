module Products
  class ImagesController < BaseController
    before_action :load_imagen, only: [:edit, :show, :update]

    def index
      @images = @product.variant_images
    end

    def new
      @image = @product.variant_images.new
    end

    def create
      @variant = @product.variants_including_master.find(params[:image][:imageable_id])

      params[:images].each do |img|
        @image = @variant.images.new(params_image)
        @image.image = img

        @image.save!
      end

      redirect_to edit_product_image_path(@product, @image), notice: 'Imagen ha sido actualizado.'
    end

    def edit
    end

    def update
      @image.update(params_image)
      redirect_to edit_product_image_path(@product, @image), notice: 'Imagen ha sido actualizado.'
    end

    private

    def params_image
      params
        .require(:image)
        .permit(
          :alt,
          :image
        )
    end

    def load_imagen
      @image = @product.variant_images.find params[:id]
    end
  end
end

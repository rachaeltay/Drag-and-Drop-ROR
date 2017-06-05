class ProductController < ApplicationController
  def new
  end

  def create
    files_list = ActiveSupport::JSON.decode(params[:files_list])
    product=Product.create(name: params[:name], description: params[:description])
    Dir.mkdir("#{Rails.root}/public/"+product.id.to_s)
    files_list.each do |pic|
      File.rename( "#{Rails.root}/"+pic, "#{Rails.root}/public/"+product.id.to_s+'/'+File.basename(pic))
      product.pics.create(name: pic)
    end
    redirect_to product_new_url, notice: "Success! Question is created."
  end

  def upload
    uploaded_pics = params[:file]
    time_footprint = Time.now.to_formatted_s(:number)
    uploaded_pics.each do |index,pic|
      File.open(Rails.root.join('public', 'uploads', pic.original_filename), 'wb') do |file|
        file.write(pic.read)
        File.rename(file, 'public/uploads/' + time_footprint + pic.original_filename)
      end
    end
    files_list = Dir['public/uploads/*'].to_json
    render json: { message: 'You have successfully uploded your images.', files_list: files_list }
  end

  private
    def params
      params.require(:product).permit(:files_list, :name, :description, :file)
    end
end

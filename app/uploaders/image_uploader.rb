class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  process resize_to_fit: [800, 800, "center"]

  version :thumb do
    process resize_to_fill: [100, 100,]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end

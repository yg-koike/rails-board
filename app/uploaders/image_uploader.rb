class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [200,200]
  process :convert => 'jpg'

  version :thumb1 do 
    process :resize_to_fill => [50, 50, gravity = ::Magick::CenterGravity]
  end

  def auto
    manipulate! do |image|
      image.auto_orient
    end
  end



  def default_url(*args)
    "default.jpg"    
  end 
  


  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg'
  end

  def filename 
    if original_filename.present?
      time = Time.now 
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase 
    end
  end
end

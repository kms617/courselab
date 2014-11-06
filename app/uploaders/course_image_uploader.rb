class CourseImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'default.png'
  end

  process :resize_to_fit => [300, 300]

  version :card do
    process :resize_to_fit => [200, 135]
  end


end

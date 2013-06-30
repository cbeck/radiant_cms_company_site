class AddContentType < ActiveRecord::Migration
  
  class Config < ActiveRecord::Base; end
  
  def self.up
    Radiant::Config['assets.content_types'] =  "image/jpeg, image/pjpeg, image/gif, image/png, image/x-png, image/jpg, video/x-m4v, video/quicktime, application/x-shockwave-flash, audio/mpeg, video/mpeg, application/pdf, application/msword, application/vnd.ms-powerpoint, application/x-msmetafile, application/zip"
  end

  def self.down

  end
  
end







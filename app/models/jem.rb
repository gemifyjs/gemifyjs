class Jem < ActiveRecord::Base
  attr_accessible :description, :name, :js

  mount_uploader :js, JsUploader
end

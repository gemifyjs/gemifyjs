class Jem < ActiveRecord::Base
  attr_accessible :description, :name, :js
  
  before_create :normalize_values

  mount_uploader :js, JsUploader

  validates :name, :uniqueness => true
  
  def normalize_values
    self.name.downcase.strip! if self.name
  end
end

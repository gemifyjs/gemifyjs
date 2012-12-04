# don't know where to require this
require 'carrierwave/orm/activerecord'

class Jem < ActiveRecord::Base
  attr_accessible :description, :base_name, :js, :author, :email, :summary, :homepage, :name
  
  before_create :normalize_values

  mount_uploader :js, JsUploader

  validates :base_name, :presence => true, :uniqueness => true, :length => {:maximum => 50}
  validates :author, :presence => true, :length => {:maximum => 100}
  validates :email, :presence => true, :length => {:maximum => 50}, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :description, :presence => true, :length => {:maximum => 500}
  validates :summary, :length => {:maximum => 500}
  validates :homepage, :length => {:maximum => 100}

  def normalize_values
    self.base_name.downcase.strip! if self.base_name
  end

  def name
    "#{base_name}-rails"
  end
end

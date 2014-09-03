class Photo < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_attached_file :photo, :styles => { :large => "700x700", :medium => "500x500", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

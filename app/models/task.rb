class Task < ApplicationRecord
  belongs_to :course

   validates_presence_of :course_id
  	validates :title, presence: true, length:{ maximum: 50}
  	validates :description, presence:true
  	
  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/	



end

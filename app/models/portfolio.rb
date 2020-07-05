class Portfolio < ApplicationRecord
	validates_presence_of :title, :thumb_image, :main_image, :body

	def self.angular 
		where( subtitle: 'Angular')
    end

    scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
end

class Portfolio < ApplicationRecord
	validates_presence_of :title, :thumb_image, :main_image, :body
end

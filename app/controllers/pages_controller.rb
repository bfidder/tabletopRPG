class PagesController < ApplicationController
skip_before_filter :authorize

	def index
		@joke = Joke.find(:one, :from => "/jokes/random")
	end
end

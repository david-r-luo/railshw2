class CitiesController < ApplicationController

	def view
		render 'index'
	end

	def create 
		@w = WeatherService.get(params[:city])
		if @w
	    # Bonus: Converting Kelvin to Fahrenheit
			@temperature = (9 / 5) * (@w[:temperature] - 273) + 32
			# Create a new city
			city = City.new(
				name: params[:city],
				temperature: @temperature, # Using the converted temperature
				description: @w[:description],
				population: params[:population],
				landmark: params[:landmark]
			)
			# Save the city so that it's in City.all
			city.save
		end
		render 'index'
	end

	def update
    	City.update(params)
    	render 'index'
  	end

end
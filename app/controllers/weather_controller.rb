class WeatherController < ApplicationController
  def index
  	@states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NB SK OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC)
  	@states.sort!
end

def weather
  	response = HTTParty.get("http://api.wunderground.com/api/#{ENV['wunderground_api_key']}/geolookup/conditions/q/#{params[:state]}/#{params[:city]}.json")

  @location = response['location']['city']
  	@temp_f = response['current_observation']['temp_f']
  	@temp_c = response['current_observation']['temp_c']
  	@weather_icon = response['current_observation']['icon_url']
  	@weather_words = response['current_observation']['weather']
  	@forecast_link = response['current_observation']['forecast_url']
  	@real_feel = response['current_observation']['feelslike_f']

  	if @weather_words == "Overcast"
    	@url = "http://cloud-maven.com/wp-content/uploads/2014/08/DSC_0367.jpg"
    elsif @weather_words == "Clear"
    	@url = "http://p1.pichost.me/i/12/1352901.jpg"
    elsif @weather_words == "Partly Cloudy"
    	@url = "http://wallpoper.com/images/00/44/82/22/cloudy_00448222.jpg"
    elsif @weather_words == "Snow"
    	@url = "http://host2post.com/server13/photos/S1H-6hjE6S1FUM~/wallpapers-trees-full-snow-cold-weather-december-mountains.jpg"
    else 
    	@url = "http://wallpoper.com/images/00/44/71/54/rainy-weather_00447154.jpg"
	end
  
  end

  def test
  	response = HTTParty.get("http://api.wunderground.com/api/#{ENV['wunderground_api_key']}/geolookup/conditions/q/NC/Wilmington.json")

  	@location = response['location']['city']
  	@temp_f = response['current_observation']['temp_f']
  	@temp_c = response['current_observation']['temp_c']
  	@weather_icon = response['current_observation']['icon_url']
  	@weather_words = response['current_observation']['weather']
  	@forecast_link = response['current_observation']['forecast_url']
  	@real_feel = response['current_observation']['feelslike_f']
  end
end

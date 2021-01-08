require 'net/http'
require 'json'

class OpenWeather

  attr_reader :url, :options, :weather_info, :status, :message

  def initialize
  end


  def success?
    @status == 200
  end

  def one_call(lat, lon, lang, current_only=false)
    @status  = false
    if current_only
      @url = 'https://api.openweathermap.org/data/2.5/weather'
      @options = { units: "metric", APPID: ENV['OPENWEATHER_KEY'], lat: lat, lon: lon, lang: lang }
    else
      @url = 'https://api.openweathermap.org/data/2.5/onecall'
      exclude = 'minutely,hourly,alerts'
      exclude += 'daily' if current_only
      @options = { units: "metric", APPID: ENV['OPENWEATHER_KEY'], exclude:exclude, lat: lat, lon: lon, lang: lang }
    end

    response = send_request url unless @options.empty?
    parse_response(response)
  end

  private

  def extract_options!(options)
    valid_options = [ :id, :lat, :lon, :cnt, :city, :lang, :units, :APPID,
                      :country, :bbox]

    options.keys.each { |k| options.delete(k) unless valid_options.include?(k) }

    if options[:city] || options[:country]
      options[:q] = "#{options[:country]},#{options[:city]}"
      options.delete(:city)
      options.delete(:country)
    end

    options
  end

  def parse_response(response)
    return if response.nil?
    @weather_info = JSON.parse(response)
    @status       = @weather_info['cod']
    @message      = @weather_info['message'] unless @status
    @weather_info
  end

  def send_request(url=nil)
    url       = url || @url
    uri       = URI(url)
    uri.query = URI.encode_www_form(options)
    Net::HTTP.get(uri)
  end

end
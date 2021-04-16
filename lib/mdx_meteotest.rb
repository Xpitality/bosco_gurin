require 'net/http'
require 'json'

class MdxMeteotest

  WEATHER_DESCRIPTIONS = {
      1 => { description: "sunny", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/1.png" },
      2 => { description: "mostly sunny", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/2.png" },
      3 => { description: "cloudy", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/3.png" },
      4 => { description: "heavily cloudy", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/4.png" },
      5 => { description: "thunderstorm (heat)", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/5.png" },
      6 => { description: "heavy rain", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/6.png" },
      7 => { description: "snowfall", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/7.png" },
      8 => { description: "fog", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/8.png" },
      9 => { description: "sleet", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/9.png" },
      10 => { description: "sleet", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/10.png" },
      11 => { description: "light rain", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/11.png" },
      12 => { description: "snow shower", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/12.png" },
      13 => { description: "thunderstorm", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/13.png" },
      14 => { description: "low stratus", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/14.png" },
      15 => { description: "sleet shower", icon: "#{Rails.application.credentials.config[:domain_name]}/mdx/weather_icon/15.png" }
  }

  attr_reader :url, :options, :weather_info, :status, :meteo_standard, :meteo_days

  def initialize
    # https://mdx.meteotest.ch/api_v1?key=73C13ABFD6EFCBE70C0AACF6B09CE80D&service=prod2data&action=xpitality&format=jsonarray
    @url = 'https://mdx.meteotest.ch/api_v1'
    @options = { key: Rails.application.credentials.config[:mdxmeteotest_key], service: 'prod2data', action: 'xpitality', format: 'jsonarray' }
  end

  def call
    response = send_request
    parse_response(response)
  end

  def success?
    @status == 'OK'
  end

  private

  def parse_response(response)
    return if response.nil?
    @weather_info = JSON.parse(response)
    @status = @weather_info['status']
    if success?
      @meteo_standard = @weather_info['payload']['mos']
      @meteo_days = @weather_info['payload']['prognose']
    end
  end

  def send_request
    uri = URI(@url)
    uri.query = URI.encode_www_form(@options)
    Net::HTTP.get(uri)
  end
end
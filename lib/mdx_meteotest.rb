require 'net/http'
require 'json'

class MdxMeteotest

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
    @status       = @weather_info['status']
    if success?
      @meteo_standard = @weather_info['payload']['mos']
      @meteo_days = @weather_info['payload']['prognose']
    end
  end

  def send_request
    uri       = URI(@url)
    uri.query = URI.encode_www_form(@options)
    Net::HTTP.get(uri)
  end
end
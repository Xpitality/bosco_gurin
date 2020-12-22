require 'rails_helper'

describe Api::V1::LocationsController, type: :request do

  let(:headers) { { 'Content-Type': 'application/json', 'Accept': 'application/json' } }
  let(:endpoint) { api_v1_locations_path }

  it 'returns 200 and all locations' do
    FactoryBot.create_list(:location, 3)

    get endpoint, headers: headers

    # puts response.body

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)
    expect_json_types(locations: :array_of_objects)
    expect_json_sizes(locations: 3)
    expect_json_keys('locations.*', [:id, :elevation, :lat, :lng, :name, :webcam, :date, :open_weather_time, :open_weather_report])
  end
end

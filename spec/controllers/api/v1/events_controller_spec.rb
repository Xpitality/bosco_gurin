require 'rails_helper'

describe Api::V1::EventsController, type: :request do

  let(:headers) { { 'Content-Type': 'application/json', 'Accept': 'application/json' } }
  let(:endpoint) { api_v1_events_path }

  it 'returns 200 and all events' do
    FactoryBot.create_list(:event, 3)

    get endpoint, headers: headers

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)

    # puts response.body

    expect_json_types(events: :array_of_objects)
    expect_json_sizes(events: 3)
    expect_json_keys('events.*', [:title, :text, :date_from, :date_to, :expiry_date])
  end
end

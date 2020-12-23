require 'rails_helper'

describe Api::V1::NotificationsController, type: :request do

  let(:headers) { { 'Content-Type': 'application/json', 'Accept': 'application/json' } }
  let(:endpoint) { api_v1_notifications_path }

  it 'returns 200 and notifications array' do
    FactoryBot.create(:notification, pushed: true)

    get endpoint, headers: headers

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)

    # puts response.body

    expect_json_types(notifications: :array_of_objects)
    expect_json_sizes(notifications: 1)
    expect_json_keys('notifications.*', [:text, :id, :created_at, :updated_at])
  end

  it 'returns 200 and empty' do
    FactoryBot.create(:notification, pushed: false)

    get endpoint, headers: headers

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)

    # puts response.body

    expect_json_types(notifications: :array_of_objects)
    expect_json_sizes(notifications: 0)

  end

end

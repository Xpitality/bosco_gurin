require 'rails_helper'

describe Api::V1::LinksController, type: :request do

  let(:headers) { { 'Content-Type': 'application/json', 'Accept': 'application/json' } }
  let(:endpoint) { api_v1_links_path }

  it 'returns 200 and all links' do
    FactoryBot.create_list(:link, 3)

    get endpoint, headers: headers

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)

    # puts response.body

    expect_json_types(links: :array_of_objects)
    expect_json_sizes(links: 3)
    expect_json_keys('links.*', [:title, :link])
  end
end

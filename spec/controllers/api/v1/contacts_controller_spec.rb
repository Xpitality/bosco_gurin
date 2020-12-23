require 'rails_helper'

describe Api::V1::ContactsController, type: :request do

  let(:headers) { { 'Content-Type': 'application/json', 'Accept': 'application/json' } }
  let(:endpoint) { api_v1_contacts_path }

  it 'returns 200 and all contacts' do
    FactoryBot.create_list(:contact, 3)

    get endpoint, headers: headers

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)

    # puts response.body

    expect_json_types(contacts: :array_of_objects)
    expect_json_sizes(contacts: 3)
    expect_json_keys('contacts.*', [:title, :contact])
  end
end

require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  describe 'GET #index' do
    let!(:picture) { create(:picture, :with_attachment) }

    it 'is successful' do
      get :index
      expect(response).to be_successful
      response_body = JSON.parse(response.body)
      expect(response_body[0]['attachment_url']).to be_present
    end
  end

  describe 'POST #create' do
    let(:file_upload) { fixture_file_upload(file_fixture('rails-logo.png'), 'image/png') }

    it 'is successful' do
      post :create, params: { picture: { attachment: file_upload } }
      expect(response.status).to eq(201)
    end
  end
end

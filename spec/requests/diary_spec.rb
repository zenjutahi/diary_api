require 'rails_helper'

RSpec.describe 'Diaries API', type: :request do
  #initialize test data
  let!(:diaries) { create_list(:diary, 10) }
  let(:diary_id) { diaries.first.id}
  
  # Test suite for GET /diaries
  describe 'GET /diaries' do
    # make HTTP request before each Test
    before { get '/diaries'}
    
    it 'returns diaries' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  # Test for Get /diaries/:id
  describe 'GET /diaries/:id' do
    before { get "/diaries/#{diary_id}" }
    
    context 'when the recort exists' do
      it 'returns the diaries' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(diary_id)
      end
      
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    
    context 'when record does not exist' do
      let(:diary_id) { 100 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Diary/)
      end
    end
  end
  
  # Test suite for POST /todos
  describe 'POST /diaries' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/diaries', params: valid_attributes }

      it 'creates a diary' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/diaries', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
  
    # Test suite for PUT /todos/:id
  describe 'PUT /diaries/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/diaries/#{diary_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
  
    # Test suite for DELETE /todos/:id
  describe 'DELETE /diaries/:id' do
    before { delete "/diaries/#{diary_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
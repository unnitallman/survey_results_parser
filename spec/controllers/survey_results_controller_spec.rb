require 'rails_helper'

describe SurveyResultsController do
  describe '#index' do
    before do
      get :index
    end

    it 'returns an OK response' do
      expect(response.status).to eq 200
    end
  end

  describe '#show' do
    before do
      get :show, id: 1
    end

    it 'returns an OK response' do
      expect(response.status).to eq 200
    end
  end
end

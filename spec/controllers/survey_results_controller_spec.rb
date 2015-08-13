require 'rails_helper'

describe SurveyResultsController do
  describe '#index' do
    before do
      @s1 = create :survey
      @s2 = create :survey
      get :index
    end

    it 'returns an OK response' do
      expect(response.status).to eq 200
    end

    it 'fetches the surveys' do
      expect(assigns[:surveys].to_a).to eq [@s2, @s1]
    end
  end

  describe '#show' do

    before do
      @s1 = create :survey
      get :show, id: @s1.id
    end

    it 'returns an OK response' do
      expect(response.status).to eq 200
    end

    it 'fetches the survey' do
      expect(assigns[:survey]).to eq @s1
    end
  end

  describe '#destroy' do

    before do
      @s1 = create :survey
    end

    it 'redirects to index page' do
      expect(
        delete :destroy, id: @s1.id
      ).to redirect_to survey_results_path
    end

    it 'deletes the survey' do
      expect{
        delete :destroy, id: @s1.id
      }.to change{Survey.count}.by(-1)

    end
  end

  describe '#create' do

    it 'redirects to index page' do
      expect(
        post :create
      ).to redirect_to survey_results_path
    end

    it 'deletes the survey' do
      expect{
        post :create, file: Rack::Test::UploadedFile.new(Rails.root.join('example_data','example-1.csv'), "mime/type")
      }.to change{Survey.count}.by(1)
    end
  end
end

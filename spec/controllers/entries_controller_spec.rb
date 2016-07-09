require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:entry) { FactoryGirl.create(:entry) }

  before(:all) do
    DatabaseCleaner.start
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'GET #index' do
    it 'populates an array of entries' do
      get :index
      expect(assigns(:entries)).to eq([entry])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new entry in the database' do
        expect { post :create, entry: FactoryGirl.attributes_for(:entry) }
          .to change(Entry, :count).by(1)
      end

      it 'redirects to the home page' do
        post :create, entry: FactoryGirl.attributes_for(:entry)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new entry in the database' do
        expect do
          post :create, entry: FactoryGirl.attributes_for(:invalid_entry)
        end
          .to_not change(Entry, :count)
      end

      it 're-renders the :index template' do
        post :create, entry: FactoryGirl.attributes_for(:invalid_entry)
        expect(response).to render_template :index
      end
    end
  end
end
